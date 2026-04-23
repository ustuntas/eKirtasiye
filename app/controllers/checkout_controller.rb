class CheckoutController < ApplicationController
  before_action :require_authentication
  before_action :load_cart

  def index
    unless @cart && @cart.cart_items.any?
      redirect_to products_path, alert: "Sepetiniz boş"
      return
    end
    
    @addresses = Current.user.addresses.order(default: :desc, created_at: :desc)
  end

  def create
    redirect_to address_checkout_index_path
  end

  def address
    unless @cart && @cart.cart_items.any?
      redirect_to products_path, alert: "Sepetiniz boş"
      return
    end
    
    @addresses = Current.user.addresses.order(default: :desc, created_at: :desc)
  end

  def save_address
    if params[:address_id].present?
      session[:checkout_address_id] = params[:address_id]
      redirect_to payment_checkout_index_path
    elsif params[:address].present?
      address = Current.user.addresses.build(address_params)
      if address.save
        session[:checkout_address_id] = address.id
        redirect_to payment_checkout_index_path, notice: "Adres kaydedildi"
      else
        @addresses = Current.user.addresses.order(default: :desc, created_at: :desc)
        render :address, status: :unprocessable_entity
      end
    else
      redirect_to address_checkout_index_path, alert: "Adres secin veya yeni adres ekleyin"
    end
  end

  def payment
    unless session[:checkout_address_id]
      redirect_to address_checkout_index_path, alert: "Lutfen adres secin"
      return
    end
    
    @address = Address.find_by(id: session[:checkout_address_id], user: Current.user)
    unless @address
      redirect_to address_checkout_index_path, alert: "Adres bulunamadi"
      return
    end
  end

  def process_payment
    unless session[:checkout_address_id]
      redirect_to address_checkout_index_path, alert: "Lutfen adres secin"
      return
    end
    
    @address = Address.find_by(id: session[:checkout_address_id], user: Current.user)
    unless @address
      redirect_to address_checkout_index_path, alert: "Adres bulunamadi"
      return
    end
    
    ActiveRecord::Base.transaction do
      order = Order.create!(
        user: Current.user,
        address: @address,
        order_status: :pending,
        payment_status: :unpaid,
        total_amount: @cart.final_amount,
        school: @cart.school,
        coupon_code: @cart.coupon_code,
        applied_points: @cart.applied_points
      )
      
      @cart.cart_items.each do |cart_item|
        order.order_items.create!(
          product: cart_item.product,
          quantity: cart_item.quantity,
          unit_price: cart_item.price,
          from_list: cart_item.from_list
        )
      end
      
      if @cart.applied_points.to_i > 0 && @cart.school
        school_point = Current.user.school_point_for(@cart.school)
        school_point.withdraw(@cart.applied_points, order, :used) if school_point
      end
      
      if @cart.coupon_code
        @cart.coupon_code.increment!(:used_count)
      end
      
      @cart.cart_items.destroy_all
      @cart.update(coupon_code_id: nil, applied_points: 0)
      
      session[:last_order_id] = order.id
      session.delete(:checkout_address_id)
    end
    
    redirect_to confirmation_checkout_index_path, notice: "Siparisiniz olusturuldu"
  rescue ActiveRecord::RecordInvalid => e
    redirect_to payment_checkout_index_path, alert: "Hata: #{e.message}"
  end

  def confirmation
    @order = Order.find_by(id: session[:last_order_id]) if session[:last_order_id]
    session.delete(:last_order_id)
    
    unless @order
      redirect_to orders_path, alert: "Siparis bulunamadi"
      return
    end
  end

  private

  def load_cart
    @cart = Cart.find_by(user: Current.user) if Current.user
    @cart ||= Cart.find_by(id: session[:cart_id]) if session[:cart_id]
  end

  def address_params
    params.require(:address).permit(:name, :phone, :address_line1, :address_line2, :city, :district, :zip_code, :default)
  end
end
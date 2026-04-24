class CartsController < ApplicationController
  before_action :require_authentication, except: [:show]
  before_action :load_cart, only: [:show, :add_item, :remove_item, :update_item, :apply_coupon, :apply_points]

  def show
    @cart_items = @cart.cart_items.includes(:product)
  end

  def update
    if @cart.update(cart_params)
      redirect_to cart_path, notice: "Sepet güncellendi"
    else
      redirect_to cart_path, alert: "Sepet güncellenemedi"
    end
  end

  def destroy
    @cart.cart_items.destroy_all
    redirect_to cart_path, notice: "Sepet temizlendi"
  end

  def add_item
    product = Product.find(params[:product_id])
    quantity = params[:quantity]&.to_i || 1
    
    @cart.add_product(product, quantity)
    
    redirect_to cart_path, notice: "Ürün sepete eklendi"
  end

  def update_item
    cart_item = CartItem.find_by(id: params[:id])
    
    unless cart_item
      redirect_to cart_path, alert: "Ürün bulunamadı"
      return
    end
    
    @cart = cart_item.cart
    
    quantity = params[:quantity]&.to_i
    
    if quantity.present? && quantity > 0
      cart_item.update(quantity: quantity)
      redirect_to cart_path, notice: "Miktar güncellendi"
    else
      redirect_to cart_path, alert: "Geçersiz miktar"
    end
  end

  def remove_item
    cart_item = CartItem.find_by(id: params[:id])
    
    unless cart_item
      redirect_to cart_path, alert: "Ürün bulunamadı"
      return
    end
    
    @cart = cart_item.cart
    cart_item.destroy
    
    redirect_to cart_path, notice: "Ürün sepetten kaldırıldı"
  end

  def apply_coupon
    code = params[:coupon_code]&.strip
    
    coupon = CouponCode.find_by(code: code, active: true)
    
    if coupon
      if coupon.valid_for?(@cart)
        @cart.update(coupon_code_id: coupon.id)
        redirect_to cart_path, notice: "Kupon uygulandı: #{coupon.description}"
      else
        redirect_to cart_path, alert: "Bu kupon sepetiniz için geçerli değil"
      end
    else
      redirect_to cart_path, alert: "Kupon kodu bulunamadı"
    end
  end

  def apply_points
    points = params[:points]&.to_i || 0
    
    if points > 0 && Current.user
      school_point = Current.user.school_point_for(@cart.school)
      if school_point && school_point.balance >= points
        @cart.update(applied_points: points)
        redirect_to cart_path, notice: "#{points} puan kullanıldı"
      else
        redirect_to cart_path, alert: "Yeterli puanınız yok"
      end
    else
      redirect_to cart_path, alert: "Geçersiz puan miktarı"
    end
  end

  private

  def load_cart
    if Current.user
      @cart = Cart.find_or_create_by(user: Current.user)
    else
      guest_token = session[:guest_cart_token] ||= SecureRandom.uuid
      @cart = Cart.find_or_initialize_by(session_id: guest_token)
      if @cart.new_record?
        @cart.session_id = guest_token
        @cart.save!
      end
      session[:guest_cart_token] = guest_token
    end
  end

  def merge_guest_cart(source_cart)
    source_cart.cart_items.each do |item|
      @cart.add_product(item.product, item.quantity, false)
    end
    source_cart.cart_items.destroy_all
  end

  def cart_params
    params.fetch(:cart, {}).permit(:school_id, :school_class_list_id, :coupon_code_id, :applied_points)
  end
end

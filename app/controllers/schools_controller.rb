class SchoolsController < ApplicationController
  skip_before_action :require_authentication, only: [:index, :show, :classes, :class_list, :add_class_list_to_cart]
  
  def index
    @schools = School.approved
  end
  
  def show
    @school = School.find(params[:id])
  end
  
  def classes
    @school = School.find(params[:id])
    @classes = @school.classes.active
  end
  
  def class_list
    @school = School.find(params[:id])
    @class_list = find_class_list if params[:class_list_id].present?
  end
  
  def add_class_list_to_cart
    @school = School.find(params[:id])
    @class_list = find_class_list if params[:class_list_id].present?
    
    unless @class_list
      redirect_to school_classes_path(@school), alert: "Liste bulunamadı"
      return
    end
    
    if Current.user
      cart = Cart.find_or_initialize_by(user: Current.user, school: @school)
      cart.save(validate: false) unless cart.persisted?
    else
      session_id = session.id || SecureRandom.hex(16)
      cart = Cart.find_or_initialize_by(session_id: session_id, school: @school)
      cart.save(validate: false) unless cart.persisted?
      session[:cart_id] = cart.id
    end
    
    added_count = 0
    @class_list.school_class_list_items.each do |list_item|
      product = list_item.product
      if product && product.active?
        cart.add_product(product, list_item.quantity, true, @class_list.version)
        added_count += 1
      end
    end
    
    if added_count > 0
      redirect_to cart_path, notice: "#{added_count} ürün sepete eklendi"
    else
      redirect_to school_classes_path(@school), alert: "Sepete eklenecek ürün bulunamadı"
    end
  end

  private

  def find_class_list
    @school.school_class_lists.find_by(id: params[:class_list_id]) ||
      @school.school_class_lists.active.find_by(classroom_id: params[:class_list_id])
  end
end

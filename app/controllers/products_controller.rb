class ProductsController < ApplicationController
  skip_before_action :require_authentication, only: [:index, :show, :add_to_cart]
  
  def index
    @products = Product.active.includes(:category)
    @products = @products.where(category_id: params[:category_id]) if params[:category_id].present?
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def add_to_cart
    product = Product.active.find(params[:id])
    quantity = params[:quantity].presence.to_i
    quantity = 1 if quantity < 1

    current_cart.add_product(product, quantity)

    respond_to do |format|
      format.html { redirect_back fallback_location: product_path(product), notice: "#{product.name} sepete eklendi" }
      format.turbo_stream
    end
  end
  
  def add_to_favorites
    redirect_back(fallback_location: root_path)
  end
end

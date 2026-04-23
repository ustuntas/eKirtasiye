class ProductsController < ApplicationController
  skip_before_action :require_authentication, only: [:index, :show]
  
  def index
    @products = Product.active.includes(:category)
    @products = @products.where(category_id: params[:category_id]) if params[:category_id].present?
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def add_to_cart
    redirect_back(fallback_location: root_path)
  end
  
  def add_to_favorites
    redirect_back(fallback_location: root_path)
  end
end
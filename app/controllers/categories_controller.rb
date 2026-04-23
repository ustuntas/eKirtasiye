class CategoriesController < ApplicationController
  skip_before_action :require_authentication, only: [:index, :show]
  
  def index
    @categories = Category.active
  end
  
  def show
    @category = Category.find(params[:id])
    @products = @category.products.active.includes(:category)
  end
end

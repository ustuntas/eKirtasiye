class Categories::ProductsController < ApplicationController
  before_action :set_category
  
  def index
    @products = @category.products.active.order(:name)
  end
  
  private
  
  def set_category
    @category = Category.find(params[:category_id])
  end
end
class Products::ReviewsController < ApplicationController
  before_action :set_product
  before_action :require_authentication
  
  def create
    @review = @product.reviews.build(review_params)
    @review.user = Current.user
    
    if @review.save
      redirect_to @product, notice: "Yorumunuz eklendi"
    else
      redirect_to @product, alert: "Yorum eklenemedi"
    end
  end
  
  def destroy
    @review = @product.reviews.find(params[:id])
    @review.destroy
    redirect_to @product, notice: "Yorum silindi"
  end
  
  private
  
  def set_product
    @product = Product.find(params[:product_id])
  end
  
  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
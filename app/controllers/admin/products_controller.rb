class Admin::ProductsController < ApplicationController
  LOW_STOCK_THRESHOLD = 10

  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.includes(:category).order(created_at: :desc).limit(150)
    @active_products_count = Product.active.count
    @low_stock_count = Product.where("stock_quantity <= ?", LOW_STOCK_THRESHOLD).count
    @total_stock_units = Product.sum(:stock_quantity)
  end

  def show
  end

  def new
    @product = Product.new(active: true)
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_product_path(@product), notice: "Ürün oluşturuldu."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to admin_product_path(@product), notice: "Ürün güncellendi."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @product.destroy
      redirect_to admin_products_path, notice: "Ürün silindi."
    else
      redirect_to admin_product_path(@product), alert: @product.errors.full_messages.to_sentence.presence || "Ürün silinemedi."
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :sku, :description, :price, :stock_quantity, :point_value, :active, :category_id)
  end
end

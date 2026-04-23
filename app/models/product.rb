class Product < ApplicationRecord
  belongs_to :category
  has_many :product_images, dependent: :destroy, class_name: "ProductImage"
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :restrict_with_error
  has_many :reviews, dependent: :restrict_with_error
  
  validates :name, presence: true
  validates :sku, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :stock_quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :point_value, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  
  scope :active, -> { where(active: true) }
  scope :in_stock, -> { where('stock_quantity > 0') }
  
  def decrease_stock(quantity)
    update(stock_quantity: stock_quantity - quantity)
  end
end

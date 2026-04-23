class ProductImage < ApplicationRecord
  belongs_to :product
  
  has_one_attached :image
  
  validates :caption, length: { maximum: 255 }
end

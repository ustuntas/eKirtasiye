class SchoolClassListItem < ApplicationRecord
  belongs_to :school_class_list
  belongs_to :product
  
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :school_class_list_id, uniqueness: { scope: :product_id }
end

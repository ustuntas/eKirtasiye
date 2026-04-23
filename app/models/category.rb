class Category < ApplicationRecord
  belongs_to :parent, class_name: 'Category', optional: true
  has_many :children, class_name: 'Category', foreign_key: 'parent_id', dependent: :restrict_with_error
  has_many :products, dependent: :restrict_with_error
  
  validates :name, presence: true
  scope :active, -> { where(active: true) }
  scope :roots, -> { where(parent_id: nil) }
end

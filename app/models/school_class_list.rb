class SchoolClassList < ApplicationRecord
  belongs_to :school
  belongs_to :classroom, class_name: 'Classroom'
  has_many :school_class_list_items, dependent: :destroy
  has_many :products, through: :school_class_list_items
  has_many :carts, dependent: :restrict_with_error
  has_many :orders, dependent: :restrict_with_error
  
  validates :name, presence: true
  validates :academic_year, presence: true
  validates :semester, presence: true
  validates :version, presence: true
  
  scope :active, -> { where(active: true) }
  
  def total_items
    school_class_list_items.sum(:quantity)
  end
  
  def total_amount
    school_class_list_items.joins(:product).sum('products.price * school_class_list_items.quantity')
  end
end

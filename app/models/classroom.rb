class Classroom < ApplicationRecord
  self.table_name = "classes"
  
  belongs_to :school
  has_many :school_class_lists, dependent: :restrict_with_error
  
  validates :name, presence: true
  validates :grade, presence: true
  validates :section, presence: true
  
  scope :active, -> { where(active: true) }
end

class SchoolAccount < ApplicationRecord
  belongs_to :school
  belongs_to :user
  
  validates :responsible_person, presence: true
  validates :phone, presence: true
  
  enum :status, { pending: 0, approved: 1, rejected: 2 }
end

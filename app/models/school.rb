class School < ApplicationRecord
  has_many :school_accounts, dependent: :restrict_with_error
  has_many :classes, dependent: :restrict_with_error
  has_many :school_class_lists, dependent: :restrict_with_error
  has_many :orders, dependent: :restrict_with_error
  has_many :school_points, dependent: :restrict_with_error
  has_many :school_point_transactions, through: :school_points
  
  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :tax_number, presence: true, uniqueness: true
  
  enum :status, { pending: 0, approved: 1, rejected: 2 }
end

class User < ApplicationRecord
  ROLES = %w[visitor customer school_admin admin personnel].freeze
  
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :orders, dependent: :restrict_with_error
  has_many :addresses, dependent: :destroy
  has_many :reviews, dependent: :restrict_with_error
  
  has_many :school_points, dependent: :destroy
  has_one :school_account, dependent: :destroy
  
  normalizes :email_address, with: ->(e) { e.strip.downcase }
  
  validates :email_address, presence: true, uniqueness: true
  validates :role, presence: true, inclusion: { in: ROLES }
  
  def visitor?
    role == 'visitor'
  end
  
  def customer?
    role == 'customer'
  end
  
  def school_admin?
    role == 'school_admin'
  end
  
  def admin?
    role == 'admin'
  end
  
  def personnel?
    role == 'personnel'
  end
  
  def school_point_for(school)
    SchoolPoint.find_by(user: self, school: school)
  end
end

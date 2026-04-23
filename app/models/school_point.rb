class SchoolPoint < ApplicationRecord
  belongs_to :school
  belongs_to :user, optional: true
  has_many :school_point_transactions, dependent: :restrict_with_error
  
  validates :balance, presence: true, numericality: { greater_than_or_equal_to: 0 }
  
  def add_points(amount, reference=nil, notes=nil)
    transaction do
      update(balance: balance + amount)
      school_point_transactions.create(
        transaction_type: :earned,
        amount: amount,
        balance_after: balance,
        reference: reference,
        notes: notes
      )
    end
  end
  
  def use_points(amount, reference=nil, notes=nil)
    return false if balance < amount
    transaction do
      update(balance: balance - amount)
      school_point_transactions.create(
        transaction_type: :used,
        amount: amount,
        balance_after: balance,
        reference: reference,
        notes: notes
      )
    end
  end
  
  alias_method :withdraw, :use_points
  
  def self.find_or_create_for(user, school)
    find_or_initialize_by(user: user, school: school).tap do |sp|
      sp.balance ||= 0
      sp.save(validate: false) unless sp.persisted?
    end
  end
end

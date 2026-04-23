class SchoolPointTransaction < ApplicationRecord
  belongs_to :school
  belongs_to :school_point, optional: true
  
  validates :amount, presence: true, numericality: true
  validates :balance_after, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :transaction_type, presence: true
  
  enum :transaction_type, { earned: 0, used: 1, refunded: 2, manual_correction: 3 }
  
  scope :earned, -> { where(transaction_type: :earned) }
  scope :used, -> { where(transaction_type: :used) }
  scope :refunded, -> { where(transaction_type: :refunded) }
end

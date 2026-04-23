class Payment < ApplicationRecord
  belongs_to :order
  
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :payment_method, presence: true
  validates :status, presence: true
  validates :transaction_id, uniqueness: true, allow_nil: true
  
  enum :payment_method, { credit_card: 0, debit_card: 1, bank_transfer: 2, cash_on_delivery: 3, point: 4 }
  enum :status, { pending: 0, completed: 1, failed: 2, refunded: 3 }
end

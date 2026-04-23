class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address, optional: true
  belongs_to :school, optional: true
  belongs_to :school_class_list, optional: true
  belongs_to :coupon_code, optional: true
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items
  has_one :payment, dependent: :destroy
  has_one :shipment, dependent: :destroy
  
  validates :total_amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :order_status, presence: true
  validates :payment_status, presence: true
  
  enum :order_status, { pending: 0, confirmed: 1, processing: 2, shipped: 3, delivered: 4, cancelled: 5, refunded: 6 }
  enum :payment_status, { unpaid: 0, paid: 1, failed: 2, refunded: 3 }
  
  def total_items
    order_items.sum(:quantity)
  end
  
  def status_i18n
    order_status_i18n
  end
  
  def calculate_total
    subtotal = order_items.sum('quantity * unit_price')
    discount = discount_amount || 0
    shipping = shipment_cost || 0
    subtotal - discount + shipping
  end
end

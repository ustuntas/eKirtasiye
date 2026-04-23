class Shipment < ApplicationRecord
  belongs_to :order
  
  validates :status, presence: true
  validates :tracking_number, uniqueness: true, allow_nil: true
  
  enum :status, { pending: 0, processing: 1, shipped: 2, in_transit: 3, delivered: 4, returned: 5 }
  
  def mark_as_shipped!(tracking_number=nil, carrier=nil)
    update(
      status: :shipped,
      tracking_number: tracking_number || self.tracking_number,
      carrier: carrier || self.carrier,
      shipped_at: Time.current
    )
  end
  
  def mark_as_delivered!
    update(status: :delivered, delivered_at: Time.current)
    order.update(order_status: :delivered) if order.may_deliver?
  end
end

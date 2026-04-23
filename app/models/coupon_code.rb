class CouponCode < ApplicationRecord
  validates :code, presence: true, uniqueness: true
  validates :discount_value, numericality: { greater_than: 0 }
  validates :max_usage, numericality: { greater_than: 0 }, allow_nil: true
  
  enum :discount_type, { percentage: 0, fixed_amount: 1 }
  enum :active, { inactive: false, active: true }
  
  scope :valid, -> { where(active: true).where('valid_until IS NULL OR valid_until > ?', Time.current) }
  
  def valid_for_use?
    return false unless active?
    return false if valid_until && valid_until < Time.current
    return false if max_usage && used_count >= max_usage
    true
  end
  
  def calculate_discount(amount)
    return 0 unless valid_for_use?
    if percentage?
      (amount * (discount_value / 100.0)).round(2)
    else
      [discount_value, amount].min
    end
  end
end

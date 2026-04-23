class Address < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true
  validates :full_address, presence: true
  validates :city, presence: true
  validates :district, presence: true
  validates :phone, presence: true
  validates :address_type, presence: true
  
  enum :address_type, { billing: 0, shipping: 1, both: 2 }
  
  scope :default, -> { where(is_default: true) }
  
  def set_as_default!
    user.addresses.update_all(is_default: false)
    update(is_default: true)
  end
end

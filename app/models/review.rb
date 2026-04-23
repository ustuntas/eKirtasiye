class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user, optional: true
  
  validates :rating, presence: true, numericality: { in: 1..5 }
  validates :product_id, uniqueness: { scope: :user_id, message: "already reviewed by this user" }, if: -> { user.present? }
  
  scope :approved, -> { where(approved: true) }
  scope :pending, -> { where(approved: false) }
  
  def approve!
    update(approved: true)
  end
end

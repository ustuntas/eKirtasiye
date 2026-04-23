class Cart < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :school, optional: true
  belongs_to :school_class_list, optional: true
  belongs_to :coupon_code, optional: true
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items
  
  def total_amount
    cart_items.sum('quantity * price')
  end
  
  def total_items
    cart_items.sum(:quantity)
  end
  
  def final_amount
    total = total_amount
    total -= applied_points.to_i if applied_points.to_i > 0
    if coupon_code && coupon_code.valid_for?(self)
      total -= coupon_code.calculate_discount(total)
    end
    [total, 0].max
  end
  
  def add_product(product, quantity=1, from_list=false, list_version=nil)
    item = cart_items.find_or_initialize_by(product: product)
    if item.persisted?
      item.update(quantity: item.quantity + quantity)
    else
      item.assign_attributes(
        quantity: quantity,
        price: product.price,
        from_list: from_list
      )
      item.save!
    end
    item
  end
end
class CreateCouponCodes < ActiveRecord::Migration[8.1]
  def change
    create_table :coupon_codes do |t|
      t.string :code
      t.integer :discount_type
      t.decimal :discount_value, precision: 10, scale: 2
      t.integer :max_usage
      t.integer :used_count
      t.boolean :active
      t.datetime :valid_until

      t.timestamps
    end
  end
end

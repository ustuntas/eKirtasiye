class CreateOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :school, null: false, foreign_key: true
      t.references :school_class_list, null: false, foreign_key: true
      t.integer :order_status
      t.decimal :total_amount, precision: 10, scale: 2
      t.decimal :discount_amount, precision: 10, scale: 2
      t.references :coupon_code, null: false, foreign_key: true
      t.integer :point_used
      t.decimal :shipment_cost, precision: 10, scale: 2
      t.integer :payment_status

      t.timestamps
    end
  end
end

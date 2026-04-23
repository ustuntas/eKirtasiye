class AddMissingColumnsToOrders < ActiveRecord::Migration[8.1]
  def change
    add_column :orders, :address_id, :bigint
    add_column :orders, :applied_points, :integer, default: 0
    
    change_column_null :orders, :school_id, true
    change_column_null :orders, :school_class_list_id, true
    change_column_null :orders, :coupon_code_id, true
    
    add_index :orders, :address_id
    add_foreign_key :orders, :addresses, column: :address_id, primary_key: :id
  end
end
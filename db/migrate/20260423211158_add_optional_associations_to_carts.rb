class AddOptionalAssociationsToCarts < ActiveRecord::Migration[8.1]
  def change
    change_column_null :carts, :user_id, true
    change_column_null :carts, :school_id, true
    change_column_null :carts, :school_class_list_id, true
    
    add_column :carts, :session_id, :string
    add_column :carts, :coupon_code_id, :bigint
    add_column :carts, :applied_points, :integer, default: 0
    
    add_index :carts, :session_id
    add_index :carts, :coupon_code_id
    
    add_foreign_key :carts, :coupon_codes, column: :coupon_code_id, primary_key: :id
  end
end
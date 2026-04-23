class CreateCarts < ActiveRecord::Migration[8.1]
  def change
    create_table :carts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :school, null: false, foreign_key: true
      t.references :school_class_list, null: false, foreign_key: true
      t.integer :list_version

      t.timestamps
    end
  end
end

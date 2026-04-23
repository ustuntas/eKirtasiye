class CreateAddresses < ActiveRecord::Migration[8.1]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :address_type
      t.string :title
      t.text :full_address
      t.string :city
      t.string :district
      t.string :zip_code
      t.string :phone
      t.boolean :is_default

      t.timestamps
    end
  end
end

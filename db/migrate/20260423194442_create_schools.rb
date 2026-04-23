class CreateSchools < ActiveRecord::Migration[8.1]
  def change
    create_table :schools do |t|
      t.string :name
      t.text :address
      t.string :phone
      t.string :email
      t.string :tax_number
      t.integer :status

      t.timestamps
    end
  end
end

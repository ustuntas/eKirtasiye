class CreateSchoolClassListItems < ActiveRecord::Migration[8.1]
  def change
    create_table :school_class_list_items do |t|
      t.references :school_class_list, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.text :notes

      t.timestamps
    end
  end
end

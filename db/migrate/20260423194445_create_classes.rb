class CreateClasses < ActiveRecord::Migration[8.1]
  def change
    create_table :classes do |t|
      t.references :school, null: false, foreign_key: true
      t.string :name
      t.string :grade
      t.string :section
      t.boolean :active

      t.timestamps
    end
  end
end

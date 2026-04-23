class CreateSchoolClassLists < ActiveRecord::Migration[8.1]
  def change
    create_table :school_class_lists do |t|
      t.references :school, null: false, foreign_key: true
      t.references :classroom, null: false, foreign_key: { to_table: :classes }
      t.string :name
      t.string :academic_year
      t.string :semester
      t.boolean :active
      t.integer :version

      t.timestamps
    end
  end
end

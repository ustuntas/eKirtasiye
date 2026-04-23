class CreateSchoolPoints < ActiveRecord::Migration[8.1]
  def change
    create_table :school_points do |t|
      t.references :school, null: false, foreign_key: true
      t.integer :balance

      t.timestamps
    end
  end
end

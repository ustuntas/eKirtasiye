class AddUserToSchoolPoints < ActiveRecord::Migration[8.1]
  def change
    add_reference :school_points, :user, null: true, foreign_key: true
    add_index :school_points, [:user_id, :school_id]
  end
end
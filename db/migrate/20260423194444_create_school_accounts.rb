class CreateSchoolAccounts < ActiveRecord::Migration[8.1]
  def change
    create_table :school_accounts do |t|
      t.references :school, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :responsible_person
      t.string :phone
      t.integer :status

      t.timestamps
    end
  end
end

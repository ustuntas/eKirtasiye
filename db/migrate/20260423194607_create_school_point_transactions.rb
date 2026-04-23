class CreateSchoolPointTransactions < ActiveRecord::Migration[8.1]
  def change
    create_table :school_point_transactions do |t|
      t.references :school, null: false, foreign_key: true
      t.integer :transaction_type
      t.integer :amount
      t.integer :balance_after
      t.string :reference
      t.text :notes

      t.timestamps
    end
  end
end

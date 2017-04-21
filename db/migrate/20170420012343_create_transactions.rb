class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.datetime :transaction_date
      t.text :description
      t.decimal :amount, precision: 18, scale: 2
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end

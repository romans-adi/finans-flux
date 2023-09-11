class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :category, null: false, foreign_key: true
      t.string :description
      t.decimal :amount

      t.timestamps
    end
  end
end

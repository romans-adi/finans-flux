class CreateEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.string :name
      t.references :author, foreign_key: { to_table: :users }
      t.decimal :amount

      t.timestamps
    end
  end
end

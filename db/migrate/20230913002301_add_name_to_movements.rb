class AddNameToMovements < ActiveRecord::Migration[7.0]
  def change
    add_column :movements, :name, :string
  end
end

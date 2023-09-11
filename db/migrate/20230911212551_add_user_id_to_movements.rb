class AddUserIdToMovements < ActiveRecord::Migration[6.0]
  def change
    add_reference :movements, :user, null: false, foreign_key: true
  end
end

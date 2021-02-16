class AddReferenceToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :brand, null: false, foreign_key: true
  end
end

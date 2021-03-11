class RemoveUserIdFromBrands < ActiveRecord::Migration[6.0]
  def change
    remove_column :brands, :user_id
  end
end

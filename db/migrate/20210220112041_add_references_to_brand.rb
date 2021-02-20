class AddReferencesToBrand < ActiveRecord::Migration[6.0]
  def change
    add_reference :brands, :user, null: false, foreign_key: true
  end
end

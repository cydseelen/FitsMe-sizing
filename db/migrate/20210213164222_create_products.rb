class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.references :brand, null: false, foreign_key: true
      t.string :garment_type
      t.string :fabric_type

      t.timestamps
    end
  end
end

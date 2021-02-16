class CreateProductSizes < ActiveRecord::Migration[6.0]
  def change
    create_table :product_sizes do |t|
      t.references :product, null: false, foreign_key: true
      t.string :size_name
      t.float :hip_measurement
      t.float :bust_measurement
      t.float :waist_measurement
      t.float :length_measurement
      t.int4range :hip_range
      t.int4range :bust_range
      t.int4range :waist_range
      t.int4range :length_range

      t.timestamps
    end
  end
end

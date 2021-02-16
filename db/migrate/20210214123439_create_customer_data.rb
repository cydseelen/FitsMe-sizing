class CreateCustomerData < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_data do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :age
      t.float :height
      t.float :weight
      t.integer :body_shape
      t.float :hip_measurement_customer
      t.float :bust_measurement_customer
      t.float :waist_measurement_customer
      t.float :length_measurement_customer

      t.timestamps
    end
  end
end

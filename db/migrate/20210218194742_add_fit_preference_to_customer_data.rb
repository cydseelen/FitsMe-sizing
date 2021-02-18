class AddFitPreferenceToCustomerData < ActiveRecord::Migration[6.0]
  def change
    add_column :customer_data, :fit_preference, :integer
  end
end

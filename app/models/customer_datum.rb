class CustomerDatum < ApplicationRecord
  belongs_to :user
  before_save :convert_user_data
  has_many :user_products
  has_many :product_sizes, through: :user_products


  def convert_user_data
    self.waist_measurement_customer = 89.1709 - (0.160655 * self.age) + ((-0.37736) * 1) + (0.831422 * self.weight) - ((-0.3911) * self.height)
    self.bust_measurement_customer = 0.62 * self.waist_measurement_customer + 45.20
    self.hip_measurement_customer = 0.7 * self.waist_measurement_customer + 47.21
    self.length_measurement_customer = self.height / 2
  end
end

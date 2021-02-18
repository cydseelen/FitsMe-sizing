class CustomerDatum < ApplicationRecord
  belongs_to :user
  before_save :convert_user_data


  def convert_user_data
    self.waist_measurement =89.1709 - (0.160655 * self.age) + ((-0.37736) * self.gender) + (0.831422 * self.weight) - ((-0.3911) * self.height)
    self.bust_measurement =0.62 * self.waist_measurement + 45.20
    self.hip_measurement =0.7 * self.waist_measurement + 47.21
    self.length_measurement =self.height / 2
  end
end

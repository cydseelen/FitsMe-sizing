class CustomerDatum < ApplicationRecord
  belongs_to :user
  #before_save :convert_user_data
  has_many :user_products, dependent: :destroy
  has_many :product_sizes, through: :user_products

  validates :age, presence: true, inclusion: { in: (15..110),
    message: "Invalid entry. Please choose a value between 16 and 90." }

  validates :height, presence: true, inclusion: { in: (120..210),
    message: "Invalid entry. Please choose a value between 120 and 210." }

  validates :weight, presence: true, inclusion: { in: (20..160),
    message: "Invalid entry. Please choose a value between 80 and 135." }

  #validates :body_shape, presence: true

  #validates :fit_preference, presence: true

  def convert_user_data
    if self.body_shape == 0 #slim
      self.waist_measurement_customer = (89.1709 + (0.160655 * self.age) - (0.37736 * 1) + (0.831422 * self.weight) - (0.3911 * self.height))-2
      self.bust_measurement_customer = (0.62 * self.waist_measurement_customer + 45.20)
      self.hip_measurement_customer = (0.7 * self.waist_measurement_customer + 47.21)
      self.length_measurement_customer = ((self.height / 2.4) * 1.4)
    elsif self.body_shape == 1 #athletic
      self.waist_measurement_customer = 89.1709 + (0.160655 * self.age) - (0.37736 * 1) + (0.831422 * self.weight) - (0.3911 * self.height)
      self.bust_measurement_customer = 0.62 * self.waist_measurement_customer + 45.20
      self.hip_measurement_customer = 0.7 * self.waist_measurement_customer + 47.21
      self.length_measurement_customer = (self.height / 2.4) * 1.4
    elsif self.body_shape == 2 #full
      self.waist_measurement_customer = (89.1709 + (0.160655 * self.age) - (0.37736 * 1) + (0.831422 * self.weight) - (0.3911 * self.height))+2
      self.bust_measurement_customer = (0.62 * self.waist_measurement_customer + 45.20)
      self.hip_measurement_customer = (0.7 * self.waist_measurement_customer + 47.21)
      self.length_measurement_customer = ((self.height / 2.4) * 1.4)
    end
  end
end

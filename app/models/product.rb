class Product < ApplicationRecord
  belongs_to :brand
  has_many :product_sizes
  validates :garment_type, inclusion: {in:  ["shirt", "pants", "jacket", "skirt", "dress", "sweater"] }
  validates :fabric_type, inclusion: {in: ["tight less than 5cm allowance", "medium +5 to 10cm allowance", "loose +10cm allowance"] }
end

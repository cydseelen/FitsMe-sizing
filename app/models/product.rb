class Product < ApplicationRecord
  belongs_to :brand
  has_one_attached :photo
  has_many :product_sizes, dependent: :destroy
  validates :garment_type, inclusion: {in:  ["shirt", "pants", "jacket", "skirt", "dress", "sweater"] }
  validates :fabric_type, inclusion: {in: ["tight less than 5cm allowance", "medium +5 to 10cm allowance", "loose +10cm allowance"] }
end

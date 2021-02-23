class Product < ApplicationRecord
  belongs_to :brand
  validates :garment_type, inclusion: {in:  ["shirt", "pants", "jacket", "skirt", "dress", "sweater"] }
  validates :fabric_type, inclusion: {in: ["polyester", "cotton", "wool", "jersey", "modal", "silk", "spandex", "tweed", "twill", "viscose", "leather", "lace", "linen", "other natural", "other synthetic"] }
end

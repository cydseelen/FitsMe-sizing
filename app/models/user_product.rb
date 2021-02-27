class UserProduct < ApplicationRecord
  belongs_to :product_size
  belongs_to :customer_datum

end

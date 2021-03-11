class Brand < ApplicationRecord
  has_many :users, dependent: :nullify
  has_many :products, dependent: :destroy
end

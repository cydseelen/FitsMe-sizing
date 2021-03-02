class Brand < ApplicationRecord
  belongs_to :user, optional: true
end

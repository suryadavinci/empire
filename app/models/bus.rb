class Bus < ApplicationRecord
  validates :name, uniqueness: true, length: {maximum: 50}

end

class Bus < ApplicationRecord
  validates :name, uniqueness: true, length: {maximum: 50}
  has_many :journeys, dependent: :destroy
end

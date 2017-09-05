class Passenger < ApplicationRecord
  belongs_to :booking
  validates :name, presence: true, length: {maximum: 50}
  validates :age, presence: true, length: {maximum: 50}

end

class Booking < ApplicationRecord
  belongs_to :journey
  belongs_to :user
  has_many :passengers, dependent: :destroy
end

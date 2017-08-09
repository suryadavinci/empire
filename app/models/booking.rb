class Booking < ApplicationRecord
  belongs_to :journey
  belongs_to :user
end

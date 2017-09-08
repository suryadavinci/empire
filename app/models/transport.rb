class Transport < ApplicationRecord
  belongs_to :bus
  belongs_to :from, class_name: "Destination"
  belongs_to :to, class_name: "Destination"
  has_many :bookings, dependent: :destroy

  validates :name, presence: true, length: {maximum: 50}
  validates :from_id, presence: true
  validates :to_id, presence: true


end

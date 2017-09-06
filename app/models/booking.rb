class Booking < ApplicationRecord
  belongs_to :journey
  belongs_to :user
  has_many :passengers, dependent: :destroy
  accepts_nested_attributes_for :passengers,
    :allow_destroy => true,
    :reject_if     => :all_blank

end

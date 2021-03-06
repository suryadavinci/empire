class Journey < ApplicationRecord

  belongs_to :bus
  belongs_to :from, class_name: "Destination"
  belongs_to :to, class_name: "Destination"


  validates :arrival_time, presence: true
  validates :departure_time, presence: true 
  validate :from_to_equivalence
  #validate :time_overlap

  has_many :bookings, dependent: :destroy
  private
    def from_to_equivalence

        errors.add(:from_id, "should not be same as To") if from_id == to_id

    end


        #
        # private
        #     def picture_size
        #       if picture.size > 5.megabytes
        #         errors.add(:picture, "should be less than 5MB")
        #       end
        #     end
end

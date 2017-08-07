class BusRoute < ApplicationRecord
  belongs_to :bus
  belongs_to :from, class_name: "Destination"
  belongs_to :to, class_name: "Destination" 
end

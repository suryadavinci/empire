class Bus < ApplicationRecord
  has_many :bus_routes, dependent: :destroy


  has_many :froms, through: :bus_routes, source: :from
  has_many :tos, through: :bus_routes, source: :to

end

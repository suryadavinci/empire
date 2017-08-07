class Destination < ApplicationRecord
    # has_many :from_relations,  class_name: "BusRoute",
    #                         foreign_key: "from_id",
    #                         dependent: :destroy
    # has_many :to_relations,  class_name: "BusRoute",
    #                         foreign_key: "to_id",
    #                         dependent: :destroy
    # has_many :froms, through: :from_relations, source: :from
    # has_many :tos, through: :to_relations, source: :to

    
    has_many :buses, through: :bus_routes



end

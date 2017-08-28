# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


p Apartment::Tenant.current

# if Apartment::Tenant.current == "empire_development"
#   p "creating tenant"
#   Apartment::Tenant.create("m")
#   Apartment::Tenant.create("gmail")
# end

if Apartment::Tenant.current == "empire_development" || Apartment::Tenant.current == "m"

    User.create!(name:  "Admin User",
               email: "admin@m.com",
               password:              "testing",
               password_confirmation: "testing",
               phone: 0,
               admin: true)

    User.create!(name:  "1",
              email: "1@m.com",
              password:              "testing",
              password_confirmation: "testing",
              phone: 1,
              admin: true)
 end

if Apartment::Tenant.current == "gmail"

   User.create!(name:  "Admin User",
              email: "admin@gmail.com",
              password:              "testing",
              password_confirmation: "testing",
              phone: 2,
              admin: true
              )

  User.create!(name:  "SuryaDaVinci",
              email: "suryadavinci@gmail.com",
              password:              "testing",
              password_confirmation: "testing",
              phone: 3
              )

end

Destination.create(name: "Chennai", code: "CHN")
Destination.create(name: "Bengaluru", code: "BNG")
Destination.create(name: "Pondicherry", code: "PDY")
Destination.create(name: "Kerala", code: "KRL")


Bus.create(name: "Bus1", max_seats: 55)
Bus.create(name: "Bus2", max_seats: 55)
Bus.create(name: "Bus3", max_seats: 55)
Bus.create(name: "Bus4", max_seats: 55)



 Journey.create(bus_id: 1,
                departure_time: DateTime.now + 5 , #"2017-08-28 07:53:00",
                arrival_time: DateTime.now + 5 + 5.hours ,#"2017-08-28 12:53:00",
                from_id: 1,
                to_id: 2,
                name: "Chennai To Bang")


 Journey.create(bus_id: 2,
                departure_time: DateTime.now + 1 , #"2017-08-28 07:53:00" ,
                arrival_time: DateTime.now + 1 + 5.hours, #{}"2017-08-28 12:53:00",
                from_id: 2,
                to_id: 1,
                name: "Bang To Chennai")

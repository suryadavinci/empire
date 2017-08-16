# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



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

User.create!(name:  "SuryaDaVinci",
            email: "suryadavinci@gmail.com",
            password:              "testing",
            password_confirmation: "testing",
            phone: 2
            )

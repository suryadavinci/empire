# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170809072530) do

  create_table "bookings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "journey_id"
    t.bigint "user_id"
    t.integer "seats_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["journey_id"], name: "index_bookings_on_journey_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "buses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "max_seats"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "destinations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jokings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "journey_id"
    t.bigint "user_id"
    t.integer "seats_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["journey_id"], name: "index_jokings_on_journey_id"
    t.index ["user_id"], name: "index_jokings_on_user_id"
  end

  create_table "journeys", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "bus_id"
    t.date "journey_date"
    t.time "departure_time"
    t.time "arrival_time"
    t.bigint "from_id"
    t.bigint "to_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["bus_id"], name: "index_journeys_on_bus_id"
    t.index ["from_id"], name: "index_journeys_on_from_id"
    t.index ["to_id"], name: "index_journeys_on_to_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phone"], name: "index_users_on_phone", unique: true
  end

  add_foreign_key "bookings", "journeys"
  add_foreign_key "bookings", "users"
  add_foreign_key "jokings", "journeys"
  add_foreign_key "jokings", "users"
  add_foreign_key "journeys", "buses"
end

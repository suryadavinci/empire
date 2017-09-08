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

ActiveRecord::Schema.define(version: 20170908065229) do

  create_table "bookings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "journey_id"
    t.bigint "user_id"
    t.integer "seats_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.date "departure_date"
    t.date "arrival_date"
    t.bigint "transport_id"
    t.index ["journey_id"], name: "index_bookings_on_journey_id"
    t.index ["transport_id"], name: "index_bookings_on_transport_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "buses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "max_seats"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
  end

  create_table "destinations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "journeys", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "bus_id"
    t.datetime "departure_time"
    t.datetime "arrival_time"
    t.bigint "from_id"
    t.bigint "to_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "cost"
    t.index ["bus_id"], name: "index_journeys_on_bus_id"
    t.index ["from_id"], name: "index_journeys_on_from_id"
    t.index ["to_id"], name: "index_journeys_on_to_id"
  end

  create_table "passengers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.decimal "age", precision: 10
    t.bigint "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_passengers_on_booking_id"
  end

  create_table "transports", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "bus_id"
    t.bigint "from_id"
    t.bigint "to_id"
    t.date "start_date"
    t.date "end_date"
    t.time "departure_time"
    t.time "arrival_time"
    t.integer "recurrence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "cost"
    t.index ["bus_id"], name: "index_transports_on_bus_id"
    t.index ["from_id"], name: "index_transports_on_from_id"
    t.index ["to_id"], name: "index_transports_on_to_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin"
    t.string "subdomain"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phone"], name: "index_users_on_phone", unique: true
  end

  add_foreign_key "bookings", "transports"
  add_foreign_key "journeys", "buses"
  add_foreign_key "passengers", "bookings"
end

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

ActiveRecord::Schema.define(version: 2020_02_05_171010) do

  create_table "bookings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "show_id"
    t.integer "no_of_tickets"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_cancelled", default: false
    t.integer "order_value"
    t.bigint "coupon_id"
    t.index ["coupon_id"], name: "index_bookings_on_coupon_id"
    t.index ["show_id"], name: "index_bookings_on_show_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "coupons", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "code"
    t.integer "discount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "screen_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shows", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "show_date"
    t.bigint "movie_id"
    t.bigint "theater_id"
    t.time "show_time"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_shows_on_movie_id"
    t.index ["theater_id"], name: "index_shows_on_theater_id"
  end

  create_table "theaters", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "seats"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.string "username"
    t.string "email"
    t.string "phone"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "shows", "movies"
end

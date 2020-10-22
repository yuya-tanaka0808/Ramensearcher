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

ActiveRecord::Schema.define(version: 2020_10_22_021636) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.text "image", null: false
    t.bigint "store_id"
    t.index ["store_id"], name: "index_images_on_store_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price", null: false
    t.string "taste", null: false
    t.bigint "store_id"
    t.index ["store_id"], name: "index_menus_on_store_id"
  end

  create_table "openings", force: :cascade do |t|
    t.time "open_hour", null: false
    t.time "last_order", null: false
    t.string "day_week", null: false
    t.string "weeks", null: false
    t.bigint "store_id"
    t.index ["store_id"], name: "index_openings_on_store_id"
  end

  create_table "public_holidays", force: :cascade do |t|
    t.date "date", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.float "rating", null: false
    t.text "comment", null: false
    t.integer "user_id"
    t.integer "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "image"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name", null: false
    t.text "address", null: false
    t.string "contact"
    t.string "line_name", null: false
    t.string "station", null: false
    t.integer "minutes_on_foot"
    t.string "link"
    t.text "open_closed"
    t.text "regular_holiday"
    t.text "note"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "images", "stores"
  add_foreign_key "menus", "stores"
  add_foreign_key "openings", "stores"
end

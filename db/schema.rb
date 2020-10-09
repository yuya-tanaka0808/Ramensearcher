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

ActiveRecord::Schema.define(version: 2020_10_09_013125) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "public_holidays", force: :cascade do |t|
    t.date "date", null: false
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
    t.bigint "city_id"
    t.index ["city_id"], name: "index_stores_on_city_id"
  end

  add_foreign_key "stores", "cities"
end

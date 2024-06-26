# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_03_22_204207) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addressables", force: :cascade do |t|
    t.string "address", null: false
    t.bigint "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address"], name: "index_addressables_on_address", unique: true
    t.index ["location_id"], name: "index_addressables_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.string "country"
    t.string "country_code"
    t.string "state"
    t.string "state_code"
    t.string "postal_code"
    t.string "city"
    t.jsonb "data", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["latitude", "longitude"], name: "index_locations_on_latitude_and_longitude"
  end

  add_foreign_key "addressables", "locations"
end

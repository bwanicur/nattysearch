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

ActiveRecord::Schema.define(version: 20180427005545) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string "contactable_id"
    t.string "contactable_type"
    t.datetime "last_updated_at"
    t.string "full_name"
    t.string "email"
    t.string "phone"
    t.string "phone2"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contactable_type", "contactable_id"], name: "index_contacts_on_contactable_type_and_contactable_id", unique: true
    t.index ["last_updated_at"], name: "index_contacts_on_last_updated_at"
  end

  create_table "organizations", force: :cascade do |t|
    t.datetime "last_updated_at"
    t.decimal "latitude"
    t.decimal "longitude"
    t.string "name"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.string "country"
    t.string "phone"
    t.string "phone2"
    t.string "fax"
    t.string "email"
    t.text "about"
    t.jsonb "urls"
    t.jsonb "api_specific_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

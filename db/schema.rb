# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_17_173538) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "properties", force: :cascade do |t|
    t.string "address"
    t.integer "user_id"
  end

  create_table "species", force: :cascade do |t|
    t.string "name"
  end

  create_table "surveys", force: :cascade do |t|
    t.integer "property_id"
    t.string "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tree_surveys", force: :cascade do |t|
    t.integer "survey_id"
    t.integer "tree_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trees", force: :cascade do |t|
    t.integer "height"
    t.integer "dbh"
    t.string "foliage"
    t.text "comments"
    t.integer "species_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "google_token"
    t.string "google_refresh_token"
    t.string "uid"
  end

end

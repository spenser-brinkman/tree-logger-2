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

ActiveRecord::Schema[7.0].define(version: 2023_05_31_213412) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "inspections", force: :cascade do |t|
    t.integer "survey_id"
    t.integer "tree_id"
    t.integer "height"
    t.integer "dbh"
    t.string "foliage"
    t.text "comments"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "properties", force: :cascade do |t|
    t.string "title"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "species", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "surveys", force: :cascade do |t|
    t.integer "property_id"
    t.integer "user_id"
    t.date "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trees", force: :cascade do |t|
    t.integer "species_id"
    t.string "name"
    t.integer "user_id"
    t.integer "property_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "google_token"
    t.string "google_refresh_token"
    t.string "uid"
    t.string "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20131216195229) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ingredient_recipes", force: true do |t|
    t.integer  "recipe_id"
    t.integer  "ingredient_id"
    t.float    "quantity"
    t.string   "unit_measure"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ingredient_recipes", ["ingredient_id"], name: "index_ingredient_recipes_on_ingredient_id", using: :btree
  add_index "ingredient_recipes", ["recipe_id"], name: "index_ingredient_recipes_on_recipe_id", using: :btree

  create_table "ingredients", force: true do |t|
    t.string   "ingredient_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parties", force: true do |t|
    t.string   "name"
    t.string   "date"
    t.string   "location"
    t.string   "email"
    t.string   "userid"
    t.string   "host_id"
    t.string   "guest_list"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipes", force: true do |t|
    t.string   "name"
    t.integer  "total_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "serves_max"
    t.string   "serves"
    t.float    "quantity"
    t.string   "unit_measure"
  end

  create_table "rides", force: true do |t|
    t.boolean  "need_ride"
    t.string   "name"
    t.string   "need_ride_location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "lat"
    t.string   "lng"
    t.string   "date"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "image"
    t.string   "link"
    t.string   "username"
    t.string   "user_location"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.boolean  "is_host"
    t.boolean  "is_attendee"
    t.boolean  "is_current_user"
  end

end

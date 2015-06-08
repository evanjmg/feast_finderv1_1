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

ActiveRecord::Schema.define(version: 20150527232845) do

  create_table "check_ins", force: true do |t|
    t.integer  "place_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "check_ins", ["place_id"], name: "index_check_ins_on_place_id"
  add_index "check_ins", ["user_id"], name: "index_check_ins_on_user_id"

  create_table "cuisines", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cuisinizations", force: true do |t|
    t.integer  "place_id"
    t.integer  "cuisine_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cuisinizations", ["cuisine_id"], name: "index_cuisinizations_on_cuisine_id"
  add_index "cuisinizations", ["place_id"], name: "index_cuisinizations_on_place_id"

  create_table "places", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.decimal  "rating"
    t.decimal  "meal_size"
    t.text     "description"
    t.string   "image_file_name"
    t.decimal  "price"
    t.string   "cuisine"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "reviews", force: true do |t|
    t.string   "comment"
    t.integer  "meal_size"
    t.decimal  "price"
    t.integer  "place_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "reviews", ["place_id"], name: "index_reviews_on_place_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",           default: false
  end

end

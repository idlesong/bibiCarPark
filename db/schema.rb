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

ActiveRecord::Schema.define(version: 20150629024403) do

  create_table "cars", force: true do |t|
    t.string   "plate"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hubs", force: true do |t|
    t.string   "status"
    t.string   "hardware_id"
    t.integer  "max_nodes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lots", force: true do |t|
    t.string   "mark"
    t.string   "area"
    t.string   "coordinate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nodes", force: true do |t|
    t.string   "hardware_id"
    t.string   "status"
    t.integer  "main_hub"
    t.integer  "alt_hub"
    t.integer  "monitor"
    t.integer  "display"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parkings", force: true do |t|
    t.datetime "enter_time"
    t.datetime "exit_time"
    t.datetime "park_time"
    t.datetime "leave_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "car_id"
  end

  create_table "payments", force: true do |t|
    t.integer  "unit_price"
    t.integer  "total_time"
    t.integer  "discount"
    t.integer  "total"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parking_id"
  end

  create_table "registrations", force: true do |t|
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "node_id"
    t.integer  "hub_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "contact"
    t.string   "sex"
    t.integer  "age"
    t.string   "group"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "authentication_token"
  end

end

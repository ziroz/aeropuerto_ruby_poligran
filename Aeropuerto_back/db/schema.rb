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

ActiveRecord::Schema.define(version: 20160806043052) do

  create_table "airplanes", force: :cascade do |t|
    t.string   "model"
    t.string   "code"
    t.string   "company"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flights", force: :cascade do |t|
    t.string   "origin"
    t.string   "destiny"
    t.datetime "date"
    t.integer  "airplane_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "flights", ["airplane_id"], name: "index_flights_on_airplane_id"

  create_table "passenger_flights", force: :cascade do |t|
    t.integer  "passenger_id"
    t.integer  "flight_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "passenger_flights", ["flight_id"], name: "index_passenger_flights_on_flight_id"
  add_index "passenger_flights", ["passenger_id"], name: "index_passenger_flights_on_passenger_id"

  create_table "passengers", force: :cascade do |t|
    t.string   "name"
    t.string   "identification"
    t.string   "phone"
    t.string   "email"
    t.string   "address"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "tokens", force: :cascade do |t|
    t.string   "token"
    t.string   "name"
    t.integer  "number_request"
    t.boolean  "active",         default: true
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "user_name"
    t.string   "email"
    t.string   "password_digest"
    t.date     "birth_date"
    t.string   "status"
    t.string   "boolean"
    t.string   "avatar_url"
    t.string   "phone"
    t.string   "identification"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end

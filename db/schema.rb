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

ActiveRecord::Schema.define(version: 20190910182024) do

  create_table "matches", force: :cascade do |t|
    t.string   "date"
    t.integer  "user_id"
    t.integer  "user_score"
    t.text     "user_notes"
    t.integer  "opponent_id"
    t.integer  "opponent_score"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "opponents", force: :cascade do |t|
    t.string   "username"
    t.integer  "age"
    t.string   "gender"
    t.text     "address"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "new"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.integer  "age"
    t.string   "gender"
    t.text     "address"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end

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

ActiveRecord::Schema.define(version: 20140725012516) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "check_ins", force: true do |t|
    t.integer  "location_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "checkpoints", force: true do |t|
    t.integer  "quest_id"
    t.integer  "location_id"
    t.integer  "step_num"
    t.text     "instructions"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.integer  "latitude"
    t.integer  "longitude"
    t.string   "name"
    t.string   "venue_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quests", force: true do |t|
    t.integer  "creator_id"
    t.string   "type"
    t.integer  "user_limit", default: -1
    t.datetime "start_date", default: '2014-07-25 15:39:47'
    t.datetime "end_date"
    t.text     "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rewards", force: true do |t|
    t.integer  "quest_id"
    t.integer  "xp",         default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_checkpoints", force: true do |t|
    t.integer  "checkpoint_id"
    t.integer  "user_id"
    t.boolean  "completed?",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_quests", force: true do |t|
    t.integer  "quest_id"
    t.integer  "user_id"
    t.boolean  "completed?", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_rewards", force: true do |t|
    t.integer  "reward_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.integer  "total_xp",               default: 0
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

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

ActiveRecord::Schema.define(version: 20140212064125) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "push_configurations", force: true do |t|
    t.string   "type",                        null: false
    t.string   "app",                         null: false
    t.text     "properties"
    t.boolean  "enabled",     default: false, null: false
    t.integer  "connections", default: 1,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "push_feedback", force: true do |t|
    t.string   "app",                          null: false
    t.string   "device",                       null: false
    t.string   "type",                         null: false
    t.string   "follow_up",                    null: false
    t.datetime "failed_at",                    null: false
    t.boolean  "processed",    default: false, null: false
    t.datetime "processed_at"
    t.text     "properties"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "push_feedback", ["processed"], name: "index_push_feedback_on_processed", using: :btree

  create_table "push_messages", force: true do |t|
    t.string   "app",                               null: false
    t.string   "device",                            null: false
    t.string   "type",                              null: false
    t.text     "properties"
    t.boolean  "delivered",         default: false, null: false
    t.datetime "delivered_at"
    t.boolean  "failed",            default: false, null: false
    t.datetime "failed_at"
    t.integer  "error_code"
    t.string   "error_description"
    t.datetime "deliver_after"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "push_messages", ["delivered", "failed", "deliver_after"], name: "index_push_messages_on_delivered_and_failed_and_deliver_after", using: :btree

  create_table "user_events", force: true do |t|
    t.integer  "user_id"
    t.integer  "shared_id"
    t.string   "name"
    t.string   "location"
    t.time     "time"
    t.integer  "min"
    t.integer  "max"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_events", ["user_id"], name: "index_user_events_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

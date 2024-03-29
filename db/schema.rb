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

ActiveRecord::Schema.define(version: 20140815163517) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conversations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "expert_id"
    t.integer  "pupil_id"
    t.string   "routing_number"
    t.datetime "last_message_sent_at"
    t.string   "status",               default: "active"
    t.integer  "number_id"
  end

  create_table "messages", force: true do |t|
    t.text     "body"
    t.integer  "conversation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sender_id"
  end

  create_table "numbers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "number"
    t.boolean  "active",     default: false
  end

  create_table "ratings", force: true do |t|
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rater_id"
    t.integer  "rated_id"
  end

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                    default: "",         null: false
    t.string   "encrypted_password",       default: "",         null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            default: 0,          null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "mobile_number"
    t.string   "expertise"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "status",                   default: "inactive"
    t.string   "zipcode"
    t.string   "tags"
    t.string   "mobile_number_normalized"
    t.boolean  "available",                default: true
    t.boolean  "admin",                    default: false
    t.string   "menu_file_name"
    t.string   "menu_content_type"
    t.integer  "menu_file_size"
    t.datetime "menu_updated_at"
    t.string   "address"
    t.boolean  "business",                 default: false
    t.string   "static_number"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end

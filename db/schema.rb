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

ActiveRecord::Schema.define(version: 20151214194753) do

  create_table "activities", force: true do |t|
    t.string   "name"
    t.text     "des"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "activity_suggestions", force: true do |t|
    t.integer  "user_id"
    t.string   "activity"
    t.text     "des"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendships", force: true do |t|
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "friend_id"
  end

  create_table "group_members", force: true do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status"
  end

  create_table "groups", force: true do |t|
    t.integer  "user_id"
    t.integer  "activity_id"
    t.integer  "privacy"
    t.integer  "max_members"
    t.datetime "start_time"
    t.datetime "end_time"
    t.float    "x_loc"
    t.float    "y_loc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.integer  "user_id"
    t.integer  "receiver_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_privacies", force: true do |t|
    t.integer  "user_id"
    t.integer  "activity_id"
    t.integer  "privacy"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password"
    t.string   "image"
    t.float    "x_loc"
    t.float    "y_loc"
    t.boolean  "gender"
    t.boolean  "available"
    t.string   "phone_number"
    t.datetime "dob"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

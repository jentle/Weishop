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

ActiveRecord::Schema.define(version: 20141212184536) do

  create_table "article_items", force: true do |t|
    t.text     "title"
    t.text     "description"
    t.string   "pic_url"
    t.string   "url"
    t.integer  "news_message_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "followers", force: true do |t|
    t.integer  "subscribe"
    t.string   "openid"
    t.string   "nickname"
    t.integer  "sex"
    t.string   "city"
    t.string   "country"
    t.string   "province"
    t.string   "language"
    t.text     "headimgurl"
    t.integer  "subscribe_time"
    t.string   "unionid"
    t.integer  "public_account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remark"
  end

  create_table "messages", force: true do |t|
    t.string   "from_user_name"
    t.string   "to_user_name"
    t.integer  "create_time"
    t.string   "msg_type"
    t.text     "content"
    t.integer  "msg_id",            limit: 8
    t.string   "media_id"
    t.text     "pic_url"
    t.string   "format"
    t.string   "thumb_media_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "follower_id"
    t.integer  "public_account_id"
    t.string   "event"
    t.float    "latitude",          limit: 24
    t.float    "longitude",         limit: 24
    t.float    "precision",         limit: 24
    t.string   "event_key"
    t.text     "recognition"
  end

  create_table "public_accounts", force: true do |t|
    t.string   "name"
    t.text     "access_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "app_id"
    t.string   "app_secret"
    t.integer  "expired_at"
    t.string   "official_name"
  end

end

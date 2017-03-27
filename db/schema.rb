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

ActiveRecord::Schema.define(version: 20170326164516) do

  create_table "commentnews", force: :cascade do |t|
    t.text     "script"
    t.integer  "video_id"
    t.integer  "user_id"
    t.boolean  "blind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "commentvideos", force: :cascade do |t|
    t.text     "script"
    t.integer  "video_id"
    t.integer  "user_id"
    t.boolean  "blind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "history_texts", force: :cascade do |t|
    t.string   "script"
    t.integer  "sender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "impressions", force: :cascade do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.text     "params"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index"
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index"
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "params"], name: "poly_params_request_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index"
  add_index "impressions", ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index"
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id"

  create_table "likenews", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "news_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likevideos", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "video_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.integer  "residence"
    t.integer  "elec_constit"
    t.integer  "support_ide"
    t.integer  "age"
    t.integer  "sex"
    t.integer  "recog"
    t.integer  "par_eval"
    t.integer  "support_re"
    t.integer  "support_gov"
    t.integer  "support_party"
    t.integer  "governer"
    t.string   "job"
    t.string   "position"
    t.string   "homenum"
    t.string   "compnum"
    t.string   "email"
    t.string   "recommender"
    t.string   "native"
    t.integer  "birth"
    t.integer  "partyfee"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "news", force: :cascade do |t|
    t.string   "title"
    t.string   "subtitle"
    t.string   "script"
    t.date     "posted"
    t.string   "imgurl"
    t.integer  "publisher"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "views",      default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "job"
    t.string   "phone"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "admin",           default: false
  end

  create_table "videos", force: :cascade do |t|
    t.string   "title"
    t.string   "subtitle"
    t.string   "videoid"
    t.string   "videolink"
    t.integer  "publisher"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "views",      default: 0
  end

end

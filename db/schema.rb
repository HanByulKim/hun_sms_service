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

ActiveRecord::Schema.define(version: 20170222163506) do

  create_table "history_texts", force: :cascade do |t|
    t.string   "script"
    t.integer  "sender"
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

end

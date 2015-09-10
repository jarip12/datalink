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

ActiveRecord::Schema.define(version: 20150910074105) do

  create_table "citizens", force: :cascade do |t|
    t.string   "id_no",      limit: 255
    t.string   "realname",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "deposits", force: :cascade do |t|
    t.date     "deposit_day"
    t.date     "receive_day"
    t.float    "amount",      limit: 24
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "educations", force: :cascade do |t|
    t.string   "education_type", limit: 255
    t.string   "school_name",    limit: 255
    t.string   "degree",         limit: 255
    t.date     "enroll_day"
    t.date     "graduation_day"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "family_relations", force: :cascade do |t|
    t.integer  "my_id",            limit: 4
    t.string   "relation_name",    limit: 255
    t.string   "relation_id_card", limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "house_purchases", force: :cascade do |t|
    t.date     "trade_date"
    t.string   "trade_type",    limit: 255
    t.string   "house_type",    limit: 255
    t.string   "house_address", limit: 255
    t.string   "house_amount",  limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "loans", force: :cascade do |t|
    t.date     "start_day"
    t.date     "end_day"
    t.string   "loan_type",     limit: 255
    t.string   "description",   limit: 255
    t.float    "amount",        limit: 24
    t.boolean  "repay_on_time"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "notaries", force: :cascade do |t|
    t.string   "no",          limit: 255
    t.string   "notary_type", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.string   "notary_type", limit: 255
    t.datetime "reserve_at"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "settings", force: :cascade do |t|
    t.string   "var",        limit: 255,   null: false
    t.text     "value",      limit: 65535
    t.integer  "thing_id",   limit: 4
    t.string   "thing_type", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true, using: :btree

  create_table "staffs", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "role",                   limit: 255
  end

  add_index "staffs", ["email"], name: "index_staffs_on_email", unique: true, using: :btree
  add_index "staffs", ["reset_password_token"], name: "index_staffs_on_reset_password_token", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "realname",               limit: 255
    t.string   "id_no",                  limit: 255
    t.string   "sex",                    limit: 255
    t.string   "mobile",                 limit: 255
    t.date     "birth_daty"
    t.date     "death_daty"
    t.string   "address",                limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "work_experiences", force: :cascade do |t|
    t.date     "start_day"
    t.date     "end_day"
    t.string   "company_name", limit: 255
    t.string   "job_title",    limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

end

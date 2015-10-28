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

ActiveRecord::Schema.define(version: 20151025025104) do

  create_table "archives", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "avatar",     limit: 255
  end

  create_table "deposits", force: :cascade do |t|
    t.date     "deposit_day"
    t.date     "receive_day"
    t.float    "amount",              limit: 24
    t.integer  "property_related_id", limit: 4
    t.boolean  "updated_once",                   default: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  create_table "educations", force: :cascade do |t|
    t.string   "education_type",    limit: 255
    t.string   "school_name",       limit: 255
    t.string   "degree",            limit: 255
    t.date     "enroll_day"
    t.date     "graduation_day"
    t.integer  "notary_related_id", limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "faker_materials", force: :cascade do |t|
    t.string   "faker_material_no",   limit: 255
    t.string   "faker_material_type", limit: 255
    t.integer  "notary_related_id",   limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "family_relateds", force: :cascade do |t|
    t.boolean  "updated_once",           default: false
    t.integer  "archive_id",   limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "family_relations", force: :cascade do |t|
    t.string   "id_no",             limit: 255
    t.string   "realname",          limit: 255
    t.string   "relation_name",     limit: 255
    t.integer  "owner_archive_id",  limit: 4
    t.integer  "family_related_id", limit: 4
    t.boolean  "synced",                        default: false
    t.boolean  "updated_once",                  default: false
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  create_table "foreign_tables", force: :cascade do |t|
    t.string   "realname",          limit: 255
    t.integer  "age",               limit: 4
    t.date     "birth_day"
    t.string   "company_location",  limit: 255
    t.string   "residence",         limit: 255
    t.string   "paperwork_name",    limit: 255
    t.string   "paperwork_no",      limit: 255
    t.string   "apply_context",     limit: 255
    t.string   "proxy_people_name", limit: 255
    t.date     "apply_date"
    t.datetime "reserve_at"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "house_purchases", force: :cascade do |t|
    t.date     "trade_day"
    t.string   "trade_type",          limit: 255
    t.string   "house_type",          limit: 255
    t.string   "house_address",       limit: 255
    t.float    "house_amount",        limit: 24
    t.integer  "property_related_id", limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "loans", force: :cascade do |t|
    t.date     "start_day"
    t.date     "end_day"
    t.string   "notary_type",         limit: 255
    t.string   "description",         limit: 255
    t.float    "amount",              limit: 24
    t.integer  "property_related_id", limit: 4
    t.boolean  "repay_on_time"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "notaries", force: :cascade do |t|
    t.string   "no",                limit: 255
    t.string   "notary_type",       limit: 255
    t.integer  "notary_related_id", limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "notary_foreign_tables", force: :cascade do |t|
    t.string   "realname",              limit: 255
    t.integer  "sex",                   limit: 4
    t.integer  "age",                   limit: 4
    t.integer  "id_no",                 limit: 4
    t.string   "use_country",           limit: 255
    t.text     "now_address",           limit: 65535
    t.text     "before_abroad_address", limit: 65535
    t.date     "abroad_day"
    t.string   "notary_type",           limit: 255
    t.string   "notary_type_info",      limit: 255
    t.string   "translate_lang",        limit: 255
    t.string   "email",                 limit: 255
    t.string   "mobile",                limit: 255
    t.integer  "file_num",              limit: 4
    t.boolean  "require_notary",                      default: true
    t.integer  "photo_num",             limit: 4
    t.text     "work_unit",             limit: 65535
    t.date     "birth_day"
    t.text     "comment",               limit: 65535
    t.string   "agent_name",            limit: 255
    t.string   "agent_relation",        limit: 255
    t.string   "agent_mobile",          limit: 255
    t.text     "agent_address",         limit: 65535
    t.string   "sync_status",           limit: 255
    t.string   "purpose",               limit: 255
    t.integer  "user_id",               limit: 4
    t.integer  "notary_record_id",      limit: 4
    t.boolean  "user_verified",                       default: false
    t.datetime "reserve_at"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  create_table "notary_records", force: :cascade do |t|
    t.string   "notary_type",       limit: 255
    t.string   "notary_id",         limit: 255
    t.integer  "user_id",           limit: 4
    t.integer  "archive_id",        limit: 4
    t.integer  "notary_related_id", limit: 4
    t.integer  "reservation_id",    limit: 4
    t.boolean  "synced",                        default: false
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  create_table "notary_relateds", force: :cascade do |t|
    t.boolean  "has_crime_record",           default: false
    t.boolean  "has_testament",              default: false
    t.integer  "archive_id",       limit: 4
    t.boolean  "updated_once",               default: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "notary_relations", force: :cascade do |t|
    t.string   "relation",                limit: 255
    t.string   "realname",                limit: 255
    t.string   "english_name",            limit: 255
    t.string   "sex",                     limit: 255
    t.date     "birth_day"
    t.text     "now_address",             limit: 65535
    t.text     "before_abroad_address",   limit: 65535
    t.integer  "notary_foreign_table_id", limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "realname",     limit: 255, default: ""
    t.string   "id_no",        limit: 255, default: ""
    t.string   "sex",          limit: 255
    t.string   "mobile",       limit: 255
    t.date     "birth_day"
    t.date     "death_day"
    t.string   "address",      limit: 255
    t.integer  "archive_id",   limit: 4
    t.boolean  "updated_once",             default: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "avatar",       limit: 255
    t.string   "id_no_img",    limit: 255
  end

  create_table "property_relateds", force: :cascade do |t|
    t.boolean  "updated_once",           default: false
    t.integer  "archive_id",   limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "notary_table_id",    limit: 4
    t.string   "notary_table_type",  limit: 255
    t.string   "status",             limit: 255
    t.integer  "user_id",            limit: 4
    t.string   "sync_user_verified", limit: 255, default: "0"
    t.datetime "reserve_at"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  create_table "settings", force: :cascade do |t|
    t.string   "var",        limit: 255,   null: false
    t.text     "value",      limit: 65535
    t.integer  "thing_id",   limit: 4
    t.string   "thing_type", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.string   "realname",               limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "realname",               limit: 255
    t.string   "id_no",                  limit: 255
    t.string   "sex",                    limit: 255
    t.string   "mobile",                 limit: 255
    t.date     "birth_daty"
    t.date     "death_daty"
    t.string   "address",                limit: 255
    t.boolean  "verified",                           default: false
  end

  create_table "work_experiences", force: :cascade do |t|
    t.date     "start_day"
    t.date     "end_day"
    t.string   "company_name",      limit: 255
    t.string   "job_title",         limit: 255
    t.integer  "notary_related_id", limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

end

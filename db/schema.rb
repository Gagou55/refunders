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

ActiveRecord::Schema.define(version: 20150430103457) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "announces", force: :cascade do |t|
    t.string   "title"
    t.integer  "price"
    t.integer  "number_of_share"
    t.text     "reason"
    t.boolean  "published",       default: false
    t.integer  "company_id"
    t.integer  "user_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "cancelled"
    t.integer  "kind_id"
  end

  add_index "announces", ["company_id"], name: "index_announces_on_company_id", using: :btree
  add_index "announces", ["kind_id"], name: "index_announces_on_kind_id", using: :btree
  add_index "announces", ["user_id"], name: "index_announces_on_user_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.text     "summary"
    t.text     "general_information"
    t.text     "business_model"
    t.text     "development"
    t.text     "vision"
    t.text     "swot"
    t.text     "team"
    t.string   "logo"
    t.integer  "ipo_company_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "sector"
    t.integer  "sector_id"
  end

  add_index "companies", ["ipo_company_id"], name: "index_companies_on_ipo_company_id", using: :btree
  add_index "companies", ["sector_id"], name: "index_companies_on_sector_id", using: :btree

  create_table "ipo_companies", force: :cascade do |t|
    t.string   "name"
    t.string   "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kinds", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "announce_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "purchases", ["announce_id"], name: "index_purchases_on_announce_id", using: :btree
  add_index "purchases", ["user_id"], name: "index_purchases_on_user_id", using: :btree

  create_table "sectors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.integer  "zip_code"
    t.string   "city"
    t.integer  "phone"
    t.string   "provider"
    t.string   "uid"
    t.string   "picture"
    t.string   "name"
    t.string   "token"
    t.datetime "token_expiry"
    t.boolean  "admin",                  default: false, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "announces", "companies"
  add_foreign_key "announces", "kinds"
  add_foreign_key "announces", "users"
  add_foreign_key "companies", "ipo_companies"
  add_foreign_key "companies", "sectors"
  add_foreign_key "purchases", "announces"
  add_foreign_key "purchases", "users"
end

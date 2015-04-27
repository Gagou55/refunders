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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20150427145023) do
=======
ActiveRecord::Schema.define(version: 20150427160122) do
>>>>>>> 9449f057aeaf525a4a3dc9151927f880d09ef3ae

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

<<<<<<< HEAD
=======
  create_table "announces", force: :cascade do |t|
    t.string   "title"
    t.integer  "price"
    t.string   "kind"
    t.integer  "number_of_share"
    t.text     "reason"
    t.boolean  "published"
    t.integer  "company_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "cancelled"
  end

  add_index "announces", ["company_id"], name: "index_announces_on_company_id", using: :btree
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
  end

  add_index "companies", ["ipo_company_id"], name: "index_companies_on_ipo_company_id", using: :btree

  create_table "ipo_companies", force: :cascade do |t|
    t.string   "name"
    t.string   "logo"
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

>>>>>>> 9449f057aeaf525a4a3dc9151927f880d09ef3ae
  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
<<<<<<< HEAD
=======
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.integer  "zip_code"
    t.string   "city"
    t.integer  "phone"
>>>>>>> 9449f057aeaf525a4a3dc9151927f880d09ef3ae
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

<<<<<<< HEAD
=======
  add_foreign_key "announces", "companies"
  add_foreign_key "announces", "users"
  add_foreign_key "companies", "ipo_companies"
  add_foreign_key "purchases", "announces"
  add_foreign_key "purchases", "users"
>>>>>>> 9449f057aeaf525a4a3dc9151927f880d09ef3ae
end

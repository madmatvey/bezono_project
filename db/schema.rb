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

ActiveRecord::Schema.define(version: 20160527101919) do

  create_table "organization_accounts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organization_profiles", force: :cascade do |t|
    t.string   "inn"
    t.string   "address_value"
    t.string   "kpp"
    t.string   "management_name"
    t.string   "management_post"
    t.string   "name_full_with_opf"
    t.string   "name_short_with_opf"
    t.string   "name_latin"
    t.string   "name_full"
    t.string   "name_short"
    t.string   "ogrn"
    t.string   "okved"
    t.string   "opf_code"
    t.string   "opf_full"
    t.string   "opf_short"
    t.datetime "state_actuality_date"
    t.datetime "state_registration_date"
    t.datetime "state_liquidation_date"
    t.string   "state_status"
    t.string   "org_type"
    t.integer  "organization_account_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "organization_profiles", ["organization_account_id"], name: "index_organization_profiles_on_organization_account_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                   default: "", null: false
    t.string   "encrypted_password",      default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "name"
    t.integer  "role"
    t.integer  "organization_account_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["organization_account_id"], name: "index_users_on_organization_account_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

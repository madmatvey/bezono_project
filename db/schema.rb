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

ActiveRecord::Schema.define(version: 20160623113206) do

  create_table "accreditations", force: :cascade do |t|
    t.integer  "state"
    t.integer  "organization_profile_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "accreditations", ["organization_profile_id"], name: "index_accreditations_on_organization_profile_id"

  create_table "demands", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "organization_profile_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "demands", ["organization_profile_id"], name: "index_demands_on_organization_profile_id"

  create_table "explanations", force: :cascade do |t|
    t.text     "message"
    t.integer  "user_id"
    t.integer  "demand_id"
    t.integer  "organization_profile_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "question_id"
  end

  add_index "explanations", ["demand_id"], name: "index_explanations_on_demand_id"
  add_index "explanations", ["organization_profile_id"], name: "index_explanations_on_organization_profile_id"
  add_index "explanations", ["question_id"], name: "index_explanations_on_question_id"
  add_index "explanations", ["user_id"], name: "index_explanations_on_user_id"

  create_table "notifications", force: :cascade do |t|
    t.integer  "user_id",            null: false
    t.integer  "actor_id"
    t.string   "notify_type",        null: false
    t.string   "target_type"
    t.integer  "target_id"
    t.string   "second_target_type"
    t.integer  "second_target_id"
    t.string   "third_target_type"
    t.integer  "third_target_id"
    t.datetime "read_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "notifications", ["user_id", "notify_type"], name: "index_notifications_on_user_id_and_notify_type"
  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id"

  create_table "notifs", force: :cascade do |t|
    t.integer  "target_id",                   null: false
    t.string   "target_type",                 null: false
    t.boolean  "sticky",      default: false
    t.integer  "user_id"
    t.boolean  "unread",      default: true
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifs", ["target_type", "target_id"], name: "index_notifs_on_target_type_and_target_id"
  add_index "notifs", ["unread"], name: "index_notifs_on_unread"
  add_index "notifs", ["user_id"], name: "index_notifs_on_user_id"

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

  create_table "state_histories", force: :cascade do |t|
    t.string   "state"
    t.string   "previous_state"
    t.integer  "stateable_id"
    t.string   "stateable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

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
    t.integer  "active_profile_id"
  end

  add_index "users", ["active_profile_id"], name: "index_users_on_active_profile_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["organization_account_id"], name: "index_users_on_organization_account_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

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

ActiveRecord::Schema.define(version: 20160831095439) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accreditations", force: :cascade do |t|
    t.integer  "state"
    t.integer  "organization_profile_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "accreditations", ["organization_profile_id"], name: "index_accreditations_on_organization_profile_id", using: :btree

  create_table "competences", force: :cascade do |t|
    t.string   "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "competences_demands", id: false, force: :cascade do |t|
    t.integer "competence_id"
    t.integer "demand_id"
  end

  add_index "competences_demands", ["competence_id"], name: "index_competences_demands_on_competence_id", using: :btree
  add_index "competences_demands", ["demand_id"], name: "index_competences_demands_on_demand_id", using: :btree

  create_table "criterions", force: :cascade do |t|
    t.string   "name",                null: false
    t.integer  "master_criterion_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "criterions", ["master_criterion_id"], name: "index_criterions_on_master_criterion_id", using: :btree

  create_table "criterions_demands", id: false, force: :cascade do |t|
    t.integer "criterion_id", null: false
    t.integer "demand_id",    null: false
  end

  add_index "criterions_demands", ["criterion_id"], name: "index_criterions_demands_on_criterion_id", using: :btree
  add_index "criterions_demands", ["demand_id"], name: "index_criterions_demands_on_demand_id", using: :btree

  create_table "demands", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "organization_profile_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "demands", ["organization_profile_id"], name: "index_demands_on_organization_profile_id", using: :btree

  create_table "explanations", force: :cascade do |t|
    t.text     "message"
    t.integer  "user_id"
    t.integer  "demand_id"
    t.integer  "organization_profile_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "question_id"
  end

  add_index "explanations", ["demand_id"], name: "index_explanations_on_demand_id", using: :btree
  add_index "explanations", ["organization_profile_id"], name: "index_explanations_on_organization_profile_id", using: :btree
  add_index "explanations", ["question_id"], name: "index_explanations_on_question_id", using: :btree
  add_index "explanations", ["user_id"], name: "index_explanations_on_user_id", using: :btree

  create_table "formulations", force: :cascade do |t|
    t.integer  "problem_id",              null: false
    t.integer  "organization_profile_id", null: false
    t.integer  "formulation_id"
    t.text     "content"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "formulations", ["formulation_id"], name: "index_formulations_on_formulation_id", using: :btree
  add_index "formulations", ["organization_profile_id"], name: "index_formulations_on_organization_profile_id", using: :btree
  add_index "formulations", ["problem_id"], name: "index_formulations_on_problem_id", using: :btree

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

  add_index "notifs", ["target_type", "target_id"], name: "index_notifs_on_target_type_and_target_id", using: :btree
  add_index "notifs", ["unread"], name: "index_notifs_on_unread", using: :btree
  add_index "notifs", ["user_id"], name: "index_notifs_on_user_id", using: :btree

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

  add_index "organization_profiles", ["organization_account_id"], name: "index_organization_profiles_on_organization_account_id", using: :btree

  create_table "problems", force: :cascade do |t|
    t.integer  "demand_id"
    t.integer  "organization_profile_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "problems", ["demand_id"], name: "index_problems_on_demand_id", using: :btree
  add_index "problems", ["organization_profile_id"], name: "index_problems_on_organization_profile_id", using: :btree

  create_table "proofs", force: :cascade do |t|
    t.integer  "state"
    t.integer  "organization_profile_id"
    t.integer  "competence_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "proofs", ["competence_id"], name: "index_proofs_on_competence_id", using: :btree
  add_index "proofs", ["organization_profile_id", "competence_id"], name: "index_proofs_on_organization_profile_id_and_competence_id", unique: true, using: :btree
  add_index "proofs", ["organization_profile_id"], name: "index_proofs_on_organization_profile_id", using: :btree

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

  add_index "users", ["active_profile_id"], name: "index_users_on_active_profile_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["organization_account_id"], name: "index_users_on_organization_account_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "demands", "organization_profiles"
  add_foreign_key "explanations", "demands"
  add_foreign_key "explanations", "organization_profiles"
  add_foreign_key "explanations", "users"
  add_foreign_key "formulations", "formulations"
  add_foreign_key "formulations", "organization_profiles"
  add_foreign_key "formulations", "problems"
  add_foreign_key "problems", "demands"
  add_foreign_key "problems", "organization_profiles"
  add_foreign_key "proofs", "competences"
  add_foreign_key "proofs", "organization_profiles"
end

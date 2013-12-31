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

ActiveRecord::Schema.define(version: 20131213170830) do

  create_table "authentications", force: true do |t|
    t.integer  "user_id"
    t.text     "provider"
    t.text     "uid"
    t.text     "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "districts", force: true do |t|
    t.integer  "state_id"
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "needs", force: true do |t|
    t.integer  "user_id"
    t.string   "blood_group"
    t.date     "required_date"
    t.integer  "required_units"
    t.text     "contact_number"
    t.integer  "state_id"
    t.integer  "district_id"
    t.text     "hospital_name"
    t.text     "reason"
    t.text     "patient_name"
    t.boolean  "is_notified"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "states", force: true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.text     "name"
    t.text     "blood_group"
    t.integer  "country_id"
    t.integer  "state_id"
    t.integer  "district_id"
    t.text     "email",                  default: "",   null: false
    t.text     "encrypted_password",     default: "",   null: false
    t.text     "avatar_url"
    t.text     "phone_no"
    t.boolean  "phone_no_visibility",    default: true
    t.text     "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.text     "current_sign_in_ip"
    t.text     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end

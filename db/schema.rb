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

ActiveRecord::Schema.define(version: 20150617061528) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "school_departments", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "school_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "school_district_invites", force: :cascade do |t|
    t.string   "email"
    t.integer  "school_district_id"
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.string   "token"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "account_type"
  end

  create_table "school_district_memberships", force: :cascade do |t|
    t.integer  "school_district_id"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "school_districts", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "website"
    t.string   "address",    null: false
    t.string   "city",       null: false
    t.string   "state",      null: false
    t.string   "zip_code",   null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "school_districts", ["name"], name: "index_school_districts_on_name", using: :btree

  create_table "school_faculty_memberships", force: :cascade do |t|
    t.integer  "school_id",                     null: false
    t.integer  "school_district_membership_id", null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name",                                  null: false
    t.string   "website"
    t.string   "address",                               null: false
    t.string   "city",                                  null: false
    t.string   "state",                                 null: false
    t.string   "zip_code",                              null: false
    t.integer  "school_district_id",                    null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "school_type"
    t.string   "status",             default: "Active", null: false
  end

  add_index "schools", ["name"], name: "index_schools_on_name", using: :btree

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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.string   "account_type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "school_district_invites", "school_districts"
  add_foreign_key "school_districts", "users"
  add_foreign_key "schools", "school_districts"
end

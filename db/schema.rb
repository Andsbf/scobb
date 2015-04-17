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

ActiveRecord::Schema.define(version: 20150417040702) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "clients", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "notes"
  end

  add_index "clients", ["user_id"], name: "index_clients_on_user_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "category_id"
    t.string   "name"
    t.integer  "capacity"
    t.decimal  "session_cost"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "courses", ["category_id"], name: "index_courses_on_category_id", using: :btree
  add_index "courses", ["employee_id"], name: "index_courses_on_employee_id", using: :btree

  create_table "dependants", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthday"
    t.string   "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "notes"
  end

  add_index "dependants", ["client_id"], name: "index_dependants_on_client_id", using: :btree

  create_table "employees", force: :cascade do |t|
    t.string   "certification"
    t.decimal  "hourly_rate"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "privelege_id"
  end

  add_index "employees", ["privelege_id"], name: "index_employees_on_privelege_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "course_id"
    t.datetime "start_time"
    t.decimal  "duration"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "events", ["course_id"], name: "index_events_on_course_id", using: :btree
  add_index "events", ["employee_id"], name: "index_events_on_employee_id", using: :btree

  create_table "paycheques", force: :cascade do |t|
    t.integer  "employee_id"
    t.decimal  "hours"
    t.decimal  "total"
    t.boolean  "is_paid"
    t.string   "payment_method"
    t.date     "payment_date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "paycheques", ["employee_id"], name: "index_paycheques_on_employee_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.boolean  "is_paid"
    t.date     "date"
    t.decimal  "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "priveleges", force: :cascade do |t|
    t.boolean  "privileges1"
    t.boolean  "priveleges2"
    t.boolean  "priveleges3"
    t.boolean  "priveleges4"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "registrations", force: :cascade do |t|
    t.integer  "payment_id"
    t.integer  "client_id"
    t.integer  "dependant_id"
    t.integer  "course_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "registrations", ["client_id"], name: "index_registrations_on_client_id", using: :btree
  add_index "registrations", ["course_id"], name: "index_registrations_on_course_id", using: :btree
  add_index "registrations", ["dependant_id"], name: "index_registrations_on_dependant_id", using: :btree
  add_index "registrations", ["payment_id"], name: "index_registrations_on_payment_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "phone_alternate"
    t.date     "birthday"
    t.string   "gender"
    t.string   "address"
    t.text     "notes"
    t.string   "user_type"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "clients", "users"
  add_foreign_key "courses", "categories"
  add_foreign_key "courses", "employees"
  add_foreign_key "dependants", "clients"
  add_foreign_key "employees", "priveleges"
  add_foreign_key "events", "courses"
  add_foreign_key "events", "employees"
  add_foreign_key "paycheques", "employees"
  add_foreign_key "registrations", "clients"
  add_foreign_key "registrations", "courses"
  add_foreign_key "registrations", "dependants"
  add_foreign_key "registrations", "payments"
end

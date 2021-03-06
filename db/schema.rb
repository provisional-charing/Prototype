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

ActiveRecord::Schema.define(version: 20190902185502) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "diseases", force: :cascade do |t|
    t.text     "name"
    t.text     "what"
    t.text     "infection"
    t.text     "symptom"
    t.text     "counteraction"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "map_entries", force: :cascade do |t|
    t.string   "name"
    t.string   "plz"
    t.string   "location"
    t.string   "street"
    t.string   "phone"
    t.string   "spec"
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "title"
    t.text     "content"
    t.datetime "remember_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["user_id"], name: "index_notes_on_user_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.text     "project_name"
    t.date     "begin"
    t.integer  "e_duration"
    t.text     "s_description"
    t.text     "description"
    t.text     "aim"
    t.text     "target_group"
    t.integer  "financial_support_needed"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "link"
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name",              default: "", null: false
    t.string   "first_name",             default: "", null: false
    t.string   "last_name",              default: "", null: false
    t.integer  "age"
    t.string   "phone"
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "role"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["user_name"], name: "index_users_on_user_name", unique: true, using: :btree
  end

  create_table "vaccination_cards", force: :cascade do |t|
    t.integer  "vaccination_id"
    t.integer  "user_id"
    t.date     "get_date"
    t.integer  "injection_type"
    t.float    "dosis_e"
    t.float    "dosis_ml"
    t.string   "typ"
    t.string   "charge_number"
    t.string   "doctor"
    t.string   "test"
    t.string   "reaktion"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["user_id"], name: "index_vaccination_cards_on_user_id", using: :btree
    t.index ["vaccination_id"], name: "index_vaccination_cards_on_vaccination_id", using: :btree
  end

  create_table "vaccinations", force: :cascade do |t|
    t.integer  "disease_id"
    t.integer  "duration"
    t.text     "e_information"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["disease_id"], name: "index_vaccinations_on_disease_id", using: :btree
  end

  add_foreign_key "notes", "users"
  add_foreign_key "vaccination_cards", "users"
  add_foreign_key "vaccination_cards", "vaccinations"
  add_foreign_key "vaccinations", "diseases"
end

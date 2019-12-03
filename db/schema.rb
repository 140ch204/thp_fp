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

ActiveRecord::Schema.define(version: 2019_12_03_133310) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_admins_on_organization_id"
    t.index ["user_id"], name: "index_admins_on_user_id"
  end

  create_table "cities", force: :cascade do |t|
    t.bigint "department_id"
    t.string "city_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_cities_on_department_id"
  end

  create_table "counterparts", force: :cascade do |t|
    t.bigint "project_id"
    t.string "name"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_counterparts_on_project_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "country_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.bigint "country_id"
    t.string "department_name"
    t.string "zip_code"
    t.string "region"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_departments_on_country_id"
  end

  create_table "donations", force: :cascade do |t|
    t.bigint "counterpart_id"
    t.bigint "organization_id"
    t.integer "donation_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["counterpart_id"], name: "index_donations_on_counterpart_id"
    t.index ["organization_id"], name: "index_donations_on_organization_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "category"
    t.string "logo_url"
    t.string "siret"
    t.boolean "is_association"
    t.boolean "is_company"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "RNA"
  end

  create_table "projects", force: :cascade do |t|
    t.bigint "organization_id"
    t.string "name"
    t.text "description"
    t.string "logo_url"
    t.datetime "starting_date"
    t.integer "donation_targeted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "donation_start"
    t.datetime "donation_end"
    t.index ["organization_id"], name: "index_projects_on_organization_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "is_admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end

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

ActiveRecord::Schema.define(version: 2021_08_17_062554) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "checks", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "customer_id"
    t.bigint "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_checks_on_customer_id"
    t.index ["employee_id"], name: "index_checks_on_employee_id"
    t.index ["project_id"], name: "index_checks_on_project_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.string "tel", null: false
    t.boolean "user_flg", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customerusers", force: :cascade do |t|
    t.bigint "customer_id"
    t.string "department"
    t.string "name", null: false
    t.string "email", default: ""
    t.string "tel"
    t.text "meta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customerusers_on_customer_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "web_flg", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.bigint "department_id"
    t.integer "position"
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_employees_on_department_id"
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
  end

  create_table "features", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "package_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["package_id"], name: "index_features_on_package_id"
  end

  create_table "packages", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projectdepartments", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_projectdepartments_on_department_id"
    t.index ["project_id"], name: "index_projectdepartments_on_project_id"
  end

  create_table "projectfeatures", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "feature_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_id"], name: "index_projectfeatures_on_feature_id"
    t.index ["project_id"], name: "index_projectfeatures_on_project_id"
  end

  create_table "projectmembers", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_projectmembers_on_employee_id"
    t.index ["project_id"], name: "index_projectmembers_on_project_id"
  end

  create_table "projectprogresses", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "employee_id"
    t.datetime "apoint_at", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_projectprogresses_on_employee_id"
    t.index ["project_id"], name: "index_projectprogresses_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "customer_id", null: false
    t.bigint "package_id", null: false
    t.text "description", null: false
    t.date "apoint_at", null: false
    t.bigint "department_id", null: false
    t.bigint "employee_id", null: false
    t.date "deadline"
    t.integer "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_projects_on_customer_id"
    t.index ["department_id"], name: "index_projects_on_department_id"
    t.index ["employee_id"], name: "index_projects_on_employee_id"
    t.index ["package_id"], name: "index_projects_on_package_id"
  end

  create_table "projectusers", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "customeruser_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customeruser_id"], name: "index_projectusers_on_customeruser_id"
    t.index ["project_id"], name: "index_projectusers_on_project_id"
  end

  add_foreign_key "checks", "customers"
  add_foreign_key "checks", "employees"
  add_foreign_key "checks", "projects"
  add_foreign_key "customerusers", "customers"
  add_foreign_key "features", "packages"
  add_foreign_key "projectdepartments", "departments"
  add_foreign_key "projectdepartments", "projects"
  add_foreign_key "projectfeatures", "features"
  add_foreign_key "projectfeatures", "projects"
  add_foreign_key "projectmembers", "employees"
  add_foreign_key "projectmembers", "projects"
  add_foreign_key "projectprogresses", "employees"
  add_foreign_key "projectprogresses", "projects"
  add_foreign_key "projects", "customers"
  add_foreign_key "projects", "departments"
  add_foreign_key "projects", "employees"
  add_foreign_key "projects", "packages"
  add_foreign_key "projectusers", "customerusers"
  add_foreign_key "projectusers", "projects"
end

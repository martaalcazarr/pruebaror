# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_09_05_233229) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipment_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "maintenance_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "maintenances", force: :cascade do |t|
    t.string "motor_name"
    t.date "date"
    t.string "email"
    t.bigint "motor_id", null: false
    t.bigint "maintenance_type_id", null: false
    t.bigint "city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_maintenances_on_city_id"
    t.index ["maintenance_type_id"], name: "index_maintenances_on_maintenance_type_id"
    t.index ["motor_id"], name: "index_maintenances_on_motor_id"
  end

  create_table "maintenances_materials", id: false, force: :cascade do |t|
    t.bigint "maintenance_id", null: false
    t.bigint "material_id", null: false
    t.index ["maintenance_id"], name: "index_maintenances_materials_on_maintenance_id"
    t.index ["material_id"], name: "index_maintenances_materials_on_material_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "motors", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "photo"
    t.bigint "user_id", null: false
    t.bigint "equipment_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipment_type_id"], name: "index_motors_on_equipment_type_id"
    t.index ["user_id"], name: "index_motors_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", default: "operador"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "maintenances", "cities"
  add_foreign_key "maintenances", "maintenance_types"
  add_foreign_key "maintenances", "motors"
  add_foreign_key "maintenances_materials", "maintenances"
  add_foreign_key "maintenances_materials", "materials"
  add_foreign_key "motors", "equipment_types"
  add_foreign_key "motors", "users"
end

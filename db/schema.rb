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

ActiveRecord::Schema[8.0].define(version: 2025_03_07_173700) do
  create_table "sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "study_materials", force: :cascade do |t|
    t.string "subject", null: false
    t.integer "material_type", default: 0, null: false
    t.string "description"
    t.integer "total_duration"
    t.integer "time_spent"
    t.integer "total_pages"
    t.integer "pages_read"
    t.integer "position", default: 0, null: false
    t.string "resource_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "study_sessions", force: :cascade do |t|
    t.integer "study_material_id", null: false
    t.text "summary"
    t.integer "pages_completed", default: 0, null: false
    t.integer "time_spent", default: 0, null: false
    t.boolean "completed", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["study_material_id"], name: "index_study_sessions_on_study_material_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "sessions", "users"
  add_foreign_key "study_sessions", "study_materials"
end

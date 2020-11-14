# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_14_224958) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "class_rooms", force: :cascade do |t|
    t.string "designation"
    t.string "location"
    t.string "string"
    t.decimal "floor"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "class_units", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_class_units_on_user_id"
  end

  create_table "lesson_hours", force: :cascade do |t|
    t.string "hour_from"
    t.string "minute_from"
    t.string "hour_to"
    t.string "minute_to"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lesson_plans", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "class_unit_id", null: false
    t.bigint "class_room_id", null: false
    t.bigint "work_day_id", null: false
    t.bigint "lesson_hour_id", null: false
    t.bigint "subject_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["class_room_id"], name: "index_lesson_plans_on_class_room_id"
    t.index ["class_unit_id"], name: "index_lesson_plans_on_class_unit_id"
    t.index ["lesson_hour_id"], name: "index_lesson_plans_on_lesson_hour_id"
    t.index ["subject_id"], name: "index_lesson_plans_on_subject_id"
    t.index ["user_id"], name: "index_lesson_plans_on_user_id"
    t.index ["work_day_id"], name: "index_lesson_plans_on_work_day_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.string "short_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "type"
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "work_days", force: :cascade do |t|
    t.string "name"
    t.string "short_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "class_units", "users"
  add_foreign_key "lesson_plans", "class_rooms"
  add_foreign_key "lesson_plans", "class_units"
  add_foreign_key "lesson_plans", "lesson_hours"
  add_foreign_key "lesson_plans", "subjects"
  add_foreign_key "lesson_plans", "users"
  add_foreign_key "lesson_plans", "work_days"
end

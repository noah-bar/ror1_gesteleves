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

ActiveRecord::Schema[7.0].define(version: 2024_02_08_102705) do
  create_table "classrooms", force: :cascade do |t|
    t.string "name"
    t.integer "start_at"
    t.integer "end_at"
    t.integer "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_classrooms_on_teacher_id"
  end

  create_table "classrooms_students", id: false, force: :cascade do |t|
    t.integer "classroom_id"
    t.integer "student_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_classrooms_students_on_classroom_id"
    t.index ["student_id"], name: "index_classrooms_students_on_student_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "type"
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.integer "npa"
    t.string "city"
    t.string "email"
    t.string "acronym"
    t.string "stat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "classrooms", "people", column: "teacher_id"
  add_foreign_key "classrooms_students", "people", column: "student_id"
end

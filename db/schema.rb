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

ActiveRecord::Schema.define(version: 2020_01_11_191808) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrators", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_administrators_on_user_id"
  end

  create_table "assignments", force: :cascade do |t|
    t.string "name"
    t.datetime "expiry_date"
    t.string "file"
    t.string "subject"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "school_class_id"
    t.bigint "teacher_id"
    t.bigint "lecture_id"
    t.index ["lecture_id"], name: "index_assignments_on_lecture_id"
    t.index ["school_class_id"], name: "index_assignments_on_school_class_id"
    t.index ["teacher_id"], name: "index_assignments_on_teacher_id"
  end

  create_table "attendances", force: :cascade do |t|
    t.datetime "date"
    t.string "absence_type"
    t.datetime "enters_at"
    t.datetime "exits_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "student_id"
    t.bigint "school_class_id"
    t.index ["school_class_id"], name: "index_attendances_on_school_class_id"
    t.index ["student_id"], name: "index_attendances_on_student_id"
  end

  create_table "communications", force: :cascade do |t|
    t.string "title"
    t.date "start_date"
    t.date "expiry_date"
    t.text "description"
    t.string "attachment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lectures", force: :cascade do |t|
    t.string "name"
    t.datetime "start_time"
    t.string "topics"
    t.string "subject"
    t.integer "duration"
    t.bigint "teacher_id"
    t.bigint "school_class_id"
    t.index ["school_class_id"], name: "index_lectures_on_school_class_id"
    t.index ["teacher_id"], name: "index_lectures_on_teacher_id"
  end

  create_table "marks", force: :cascade do |t|
    t.float "mark"
    t.string "subject"
    t.date "date"
    t.string "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "student_id"
    t.bigint "teacher_id"
    t.index ["student_id"], name: "index_marks_on_student_id"
    t.index ["teacher_id"], name: "index_marks_on_teacher_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "file"
    t.string "subject"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "school_class_id"
    t.bigint "teacher_id"
    t.index ["school_class_id"], name: "index_materials_on_school_class_id"
    t.index ["teacher_id"], name: "index_materials_on_teacher_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string "subject"
    t.string "description"
    t.datetime "date"
    t.bigint "teacher_id"
    t.bigint "student_id"
    t.bigint "school_class_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_class_id"], name: "index_notes_on_school_class_id"
    t.index ["student_id"], name: "index_notes_on_student_id"
    t.index ["teacher_id"], name: "index_notes_on_teacher_id"
  end

  create_table "officers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_officers_on_user_id"
  end

  create_table "parents", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.bigint "user_id"
    t.boolean "access_enabled", default: false
    t.index ["user_id"], name: "index_parents_on_user_id"
  end

  create_table "parents_students", id: false, force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "parent_id", null: false
    t.index ["parent_id"], name: "index_parents_students_on_parent_id"
    t.index ["student_id"], name: "index_parents_students_on_student_id"
  end

  create_table "principals", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_principals_on_user_id"
  end

  create_table "school_classes", force: :cascade do |t|
    t.string "number"
    t.string "section"
  end

  create_table "school_classes_teachers", id: false, force: :cascade do |t|
    t.bigint "teacher_id", null: false
    t.bigint "school_class_id", null: false
    t.index ["school_class_id"], name: "index_school_classes_teachers_on_school_class_id"
    t.index ["teacher_id"], name: "index_school_classes_teachers_on_teacher_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "fiscal_code"
    t.date "birth_date"
    t.date "enrollment_date"
    t.bigint "school_class_id"
    t.index ["school_class_id"], name: "index_students_on_school_class_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.bigint "user_id"
    t.string "subjects", default: [], array: true
    t.index ["user_id"], name: "index_teachers_on_user_id"
  end

  create_table "timetables", force: :cascade do |t|
    t.string "subject"
    t.integer "day_of_week"
    t.bigint "teacher_id"
    t.bigint "school_class_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "slot_time"
    t.index ["school_class_id"], name: "index_timetables_on_school_class_id"
    t.index ["teacher_id"], name: "index_timetables_on_teacher_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "password_changed", default: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end

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

ActiveRecord::Schema.define(version: 2019_11_14_102354) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lectures", force: :cascade do |t|
    t.date "start_time"
    t.date "end_time"
    t.string "topics"
    t.bigint "teacher_id"
    t.bigint "school_class_id"
    t.string "name"
    t.string "subject"
    t.index ["school_class_id"], name: "index_lectures_on_school_class_id"
    t.index ["teacher_id"], name: "index_lectures_on_teacher_id"
  end

  create_table "marks", force: :cascade do |t|
    t.float "mark"
    t.string "subject"
    t.date "date"
    t.string "notes"
    t.bigint "student_id"
    t.bigint "teacher_id"
    t.index ["student_id"], name: "index_marks_on_student_id"
    t.index ["teacher_id"], name: "index_marks_on_teacher_id"
  end

  create_table "parents", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
  end

  create_table "parents_students", id: false, force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "parent_id", null: false
    t.index ["parent_id"], name: "index_parents_students_on_parent_id"
    t.index ["student_id"], name: "index_parents_students_on_student_id"
  end

  create_table "school_classes", force: :cascade do |t|
    t.string "number"
    t.string "section"
    t.bigint "teachers_id"
    t.index ["teachers_id"], name: "index_school_classes_on_teachers_id"
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
    t.string "enrollment_date"
    t.bigint "school_class_id"
    t.index ["school_class_id"], name: "index_students_on_school_class_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.text "subjects"
    t.text "string"
    t.text "Array"
    t.bigint "school_classes_id"
    t.index ["school_classes_id"], name: "index_teachers_on_school_classes_id"
  end

end

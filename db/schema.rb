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

ActiveRecord::Schema[7.0].define(version: 2023_06_19_232638) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index %w[record_type record_id name blob_id], name: "index_active_storage_attachments_uniqueness",
                                                    unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index %w[blob_id variation_digest], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "attendances", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "group_id", null: false
    t.date "date", null: false
    t.boolean "present", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_attendances_on_group_id"
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "debts", force: :cascade do |t|
    t.money "amount", scale: 2, null: false
    t.string "concept", null: false
    t.string "description"
    t.bigint "teacher_id", null: false
    t.bigint "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "pending"
    t.index ["student_id"], name: "index_debts_on_student_id"
    t.index ["teacher_id"], name: "index_debts_on_teacher_id"
  end

  create_table "group_members", force: :cascade do |t|
    t.bigint "group_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_members_on_group_id"
    t.index ["user_id"], name: "index_group_members_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", null: false
    t.time "from_time", null: false
    t.time "to_time", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "days_of_the_week"
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "learning_resources", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.integer "belt"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_learning_resources_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.money "amount", scale: 2
    t.bigint "debt_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["debt_id"], name: "index_payments_on_debt_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "review", null: false
    t.bigint "learning_resource_id"
    t.bigint "teacher_id", null: false
    t.bigint "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["learning_resource_id"], name: "index_reviews_on_learning_resource_id"
    t.index ["student_id"], name: "index_reviews_on_student_id"
    t.index ["teacher_id"], name: "index_reviews_on_teacher_id"
  end

  create_table "student_informations", force: :cascade do |t|
    t.string "ocupation", null: false
    t.string "civil_status", null: false
    t.string "tutor_name"
    t.string "cellphone", null: false
    t.string "health_insurance", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.money "montly_payment", scale: 2, default: "0.0"
    t.index ["user_id"], name: "index_student_informations_on_user_id"
  end

  create_table "student_learning_resources", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "learning_resource_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["learning_resource_id"], name: "index_student_learning_resources_on_learning_resource_id"
    t.index %w[user_id learning_resource_id], name: "index_on_user_and_learning_resource", unique: true
    t.index ["user_id"], name: "index_student_learning_resources_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "role"
    t.integer "belt"
    t.date "birth_date"
    t.index ["belt"], name: "index_users_on_belt"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role"], name: "index_users_on_role"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "attendances", "groups"
  add_foreign_key "attendances", "users"
  add_foreign_key "debts", "users", column: "student_id"
  add_foreign_key "debts", "users", column: "teacher_id"
  add_foreign_key "groups", "users"
  add_foreign_key "learning_resources", "users"
  add_foreign_key "payments", "debts"
  add_foreign_key "reviews", "learning_resources"
  add_foreign_key "reviews", "users", column: "student_id"
  add_foreign_key "reviews", "users", column: "teacher_id"
  add_foreign_key "student_informations", "users"
  add_foreign_key "student_learning_resources", "learning_resources"
  add_foreign_key "student_learning_resources", "users"
end

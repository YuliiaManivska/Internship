ActiveRecord::Schema.define(version: 2021_12_15_130320) do

  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.bigint "physician_id"
    t.bigint "patient_id"
    t.datetime "appointment_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
    t.index ["physician_id"], name: "index_appointments_on_physician_id"
  end

  create_table "diagnosis_items", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "last_name"
    t.integer "age"
    t.string "email"
  end

  create_table "physicians", force: :cascade do |t|
    t.string "first_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "last_name"
    t.string "phone_number"
    t.string "level"
  end

end

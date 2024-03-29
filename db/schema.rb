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

ActiveRecord::Schema[7.0].define(version: 2024_03_29_201343) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
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
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "customers", force: :cascade do |t|
    t.string "full_name"
    t.string "registry_code"
    t.string "identification_code"
    t.string "zip_code"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.datetime "start"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hospitalization_items", force: :cascade do |t|
    t.integer "pet_id", null: false
    t.integer "status"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_hospitalization_items_on_pet_id"
  end

  create_table "inventory_items", force: :cascade do |t|
    t.decimal "price"
    t.string "name"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "customer_id", null: false
    t.integer "status", default: 0
    t.integer "sex", default: 0
    t.boolean "castrated"
    t.date "birthday"
    t.string "race"
    t.string "specie"
    t.integer "size"
    t.float "weight"
    t.string "color"
    t.integer "situation", default: 0
    t.text "observations"
    t.string "image_url"
    t.index ["customer_id"], name: "index_pets_on_customer_id"
  end

  create_table "service_orders", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "pet_id", null: false
    t.string "description"
    t.decimal "price"
    t.integer "inventory_item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_service_orders_on_customer_id"
    t.index ["inventory_item_id"], name: "index_service_orders_on_inventory_item_id"
    t.index ["pet_id"], name: "index_service_orders_on_pet_id"
  end

  create_table "service_queue_items", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "pet_id", null: false
    t.string "queue_name"
    t.integer "status"
    t.boolean "urgency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_service_queue_items_on_customer_id"
    t.index ["pet_id"], name: "index_service_queue_items_on_pet_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "hospitalization_items", "pets"
  add_foreign_key "pets", "customers"
  add_foreign_key "service_orders", "customers"
  add_foreign_key "service_orders", "inventory_items"
  add_foreign_key "service_orders", "pets"
  add_foreign_key "service_queue_items", "customers"
  add_foreign_key "service_queue_items", "pets"
end

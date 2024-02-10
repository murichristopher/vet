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

ActiveRecord::Schema[7.0].define(version: 2024_02_10_065350) do
  create_table "customers", force: :cascade do |t|
    t.string "full_name"
    t.string "registry_code"
    t.string "identification_code"
    t.string "zip_code"
    t.string "phone_number"
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

  add_foreign_key "hospitalization_items", "pets"
  add_foreign_key "pets", "customers"
  add_foreign_key "service_orders", "customers"
  add_foreign_key "service_orders", "inventory_items"
  add_foreign_key "service_orders", "pets"
  add_foreign_key "service_queue_items", "customers"
  add_foreign_key "service_queue_items", "pets"
end

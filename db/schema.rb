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

ActiveRecord::Schema.define(version: 2021_02_14_123520) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customer_data", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "age"
    t.float "height"
    t.float "weight"
    t.integer "body_shape"
    t.float "hip_measurement_customer"
    t.float "bust_measurement_customer"
    t.float "waist_measurement_customer"
    t.float "length_measurement_customer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_customer_data_on_user_id"
  end

  create_table "product_sizes", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.string "size_name"
    t.float "hip_measurement"
    t.float "bust_measurement"
    t.float "waist_measurement"
    t.float "length_measurement"
    t.int4range "hip_range"
    t.int4range "bust_range"
    t.int4range "waist_range"
    t.int4range "length_range"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_sizes_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.bigint "brand_id", null: false
    t.string "garment_type"
    t.string "fabric_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id"], name: "index_products_on_brand_id"
  end

  create_table "user_products", force: :cascade do |t|
    t.bigint "product_size_id", null: false
    t.bigint "customer_datum_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_datum_id"], name: "index_user_products_on_customer_datum_id"
    t.index ["product_size_id"], name: "index_user_products_on_product_size_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "customer_data", "users"
  add_foreign_key "product_sizes", "products"
  add_foreign_key "products", "brands"
  add_foreign_key "user_products", "customer_data"
  add_foreign_key "user_products", "product_sizes"
end

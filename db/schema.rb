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

ActiveRecord::Schema[8.1].define(version: 2026_04_23_211833) do
  create_table "addresses", force: :cascade do |t|
    t.integer "address_type"
    t.string "city"
    t.datetime "created_at", null: false
    t.string "district"
    t.text "full_address"
    t.boolean "is_default"
    t.string "phone"
    t.string "title"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.string "zip_code"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "cart_id", null: false
    t.datetime "created_at", null: false
    t.boolean "from_list"
    t.decimal "price", precision: 10, scale: 2
    t.integer "product_id", null: false
    t.integer "quantity"
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["product_id"], name: "index_cart_items_on_product_id"
  end

  create_table "carts", force: :cascade do |t|
    t.integer "applied_points", default: 0
    t.bigint "coupon_code_id"
    t.datetime "created_at", null: false
    t.integer "list_version"
    t.integer "school_class_list_id"
    t.integer "school_id"
    t.string "session_id"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["coupon_code_id"], name: "index_carts_on_coupon_code_id"
    t.index ["school_class_list_id"], name: "index_carts_on_school_class_list_id"
    t.index ["school_id"], name: "index_carts_on_school_id"
    t.index ["session_id"], name: "index_carts_on_session_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.boolean "active"
    t.datetime "created_at", null: false
    t.text "description"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "classes", force: :cascade do |t|
    t.boolean "active"
    t.datetime "created_at", null: false
    t.string "grade"
    t.string "name"
    t.integer "school_id", null: false
    t.string "section"
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_classes_on_school_id"
  end

  create_table "coupon_codes", force: :cascade do |t|
    t.boolean "active"
    t.string "code"
    t.datetime "created_at", null: false
    t.integer "discount_type"
    t.decimal "discount_value", precision: 10, scale: 2
    t.integer "max_usage"
    t.datetime "updated_at", null: false
    t.integer "used_count"
    t.datetime "valid_until"
  end

  create_table "order_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "order_id", null: false
    t.integer "product_id", null: false
    t.integer "quantity"
    t.decimal "total_price", precision: 10, scale: 2
    t.decimal "unit_price", precision: 10, scale: 2
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "address_id"
    t.integer "applied_points", default: 0
    t.integer "coupon_code_id"
    t.datetime "created_at", null: false
    t.decimal "discount_amount", precision: 10, scale: 2
    t.integer "order_status"
    t.integer "payment_status"
    t.integer "point_used"
    t.integer "school_class_list_id"
    t.integer "school_id"
    t.decimal "shipment_cost", precision: 10, scale: 2
    t.decimal "total_amount", precision: 10, scale: 2
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["address_id"], name: "index_orders_on_address_id"
    t.index ["coupon_code_id"], name: "index_orders_on_coupon_code_id"
    t.index ["school_class_list_id"], name: "index_orders_on_school_class_list_id"
    t.index ["school_id"], name: "index_orders_on_school_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.decimal "amount", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.integer "order_id", null: false
    t.integer "payment_method"
    t.integer "status"
    t.string "transaction_id"
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  create_table "product_images", force: :cascade do |t|
    t.string "caption"
    t.datetime "created_at", null: false
    t.integer "product_id", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_images_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.boolean "active"
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.text "description"
    t.string "name"
    t.integer "point_value"
    t.decimal "price", precision: 10, scale: 2
    t.string "sku"
    t.integer "stock_quantity"
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "comment"
    t.datetime "created_at", null: false
    t.integer "product_id", null: false
    t.integer "rating"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["product_id"], name: "index_reviews_on_product_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "school_accounts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "phone"
    t.string "responsible_person"
    t.integer "school_id", null: false
    t.integer "status"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["school_id"], name: "index_school_accounts_on_school_id"
    t.index ["user_id"], name: "index_school_accounts_on_user_id"
  end

  create_table "school_class_list_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "notes"
    t.integer "product_id", null: false
    t.integer "quantity"
    t.integer "school_class_list_id", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_school_class_list_items_on_product_id"
    t.index ["school_class_list_id"], name: "index_school_class_list_items_on_school_class_list_id"
  end

  create_table "school_class_lists", force: :cascade do |t|
    t.string "academic_year"
    t.boolean "active"
    t.integer "classroom_id", null: false
    t.datetime "created_at", null: false
    t.string "name"
    t.integer "school_id", null: false
    t.string "semester"
    t.datetime "updated_at", null: false
    t.integer "version"
    t.index ["classroom_id"], name: "index_school_class_lists_on_classroom_id"
    t.index ["school_id"], name: "index_school_class_lists_on_school_id"
  end

  create_table "school_point_transactions", force: :cascade do |t|
    t.integer "amount"
    t.integer "balance_after"
    t.datetime "created_at", null: false
    t.text "notes"
    t.string "reference"
    t.integer "school_id", null: false
    t.integer "transaction_type"
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_school_point_transactions_on_school_id"
  end

  create_table "school_points", force: :cascade do |t|
    t.integer "balance"
    t.datetime "created_at", null: false
    t.integer "school_id", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["school_id"], name: "index_school_points_on_school_id"
    t.index ["user_id", "school_id"], name: "index_school_points_on_user_id_and_school_id"
    t.index ["user_id"], name: "index_school_points_on_user_id"
  end

  create_table "schools", force: :cascade do |t|
    t.text "address"
    t.datetime "created_at", null: false
    t.string "email"
    t.string "name"
    t.string "phone"
    t.integer "status"
    t.string "tax_number"
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "shipments", force: :cascade do |t|
    t.string "carrier"
    t.datetime "created_at", null: false
    t.datetime "delivered_at"
    t.date "estimated_delivery"
    t.integer "order_id", null: false
    t.datetime "shipped_at"
    t.integer "status"
    t.string "tracking_number"
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_shipments_on_order_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.string "role"
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "products"
  add_foreign_key "carts", "coupon_codes"
  add_foreign_key "carts", "school_class_lists"
  add_foreign_key "carts", "schools"
  add_foreign_key "carts", "users"
  add_foreign_key "classes", "schools"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "addresses"
  add_foreign_key "orders", "coupon_codes"
  add_foreign_key "orders", "school_class_lists"
  add_foreign_key "orders", "schools"
  add_foreign_key "orders", "users"
  add_foreign_key "payments", "orders"
  add_foreign_key "product_images", "products"
  add_foreign_key "products", "categories"
  add_foreign_key "reviews", "products"
  add_foreign_key "reviews", "users"
  add_foreign_key "school_accounts", "schools"
  add_foreign_key "school_accounts", "users"
  add_foreign_key "school_class_list_items", "products"
  add_foreign_key "school_class_list_items", "school_class_lists"
  add_foreign_key "school_class_lists", "classes", column: "classroom_id"
  add_foreign_key "school_class_lists", "schools"
  add_foreign_key "school_point_transactions", "schools"
  add_foreign_key "school_points", "schools"
  add_foreign_key "school_points", "users"
  add_foreign_key "sessions", "users"
  add_foreign_key "shipments", "orders"
end

# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140106094918) do

  create_table "addresses", force: true do |t|
    t.string   "name"
    t.string   "zipcode"
    t.string   "phone"
    t.string   "city"
    t.string   "province"
    t.string   "district"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["name"], name: "index_addresses_on_name"
  add_index "addresses", ["phone"], name: "index_addresses_on_phone"

  create_table "assets", force: true do |t|
    t.string   "image"
    t.integer  "variant_id"
    t.integer  "position"
    t.string   "alt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assets", ["variant_id"], name: "index_assets_on_variant_id"

  create_table "line_items", force: true do |t|
    t.integer  "variant_id"
    t.integer  "order_id"
    t.decimal  "price",      precision: 8, scale: 2, null: false
    t.integer  "quantity",                           null: false
    t.string   "currency"
    t.decimal  "cost_price", precision: 8, scale: 2, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "line_items", ["order_id"], name: "index_line_items_on_order_id"
  add_index "line_items", ["variant_id"], name: "index_line_items_on_variant_id"

  create_table "option_types", force: true do |t|
    t.string   "name",         limit: 100
    t.string   "presentation", limit: 100
    t.integer  "position",                 default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "option_types_prototypes", force: true do |t|
    t.integer "prototype_id"
    t.integer "option_type_id"
  end

  create_table "option_values", force: true do |t|
    t.string   "name"
    t.string   "presentation"
    t.integer  "position"
    t.integer  "option_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "option_values_variants", force: true do |t|
    t.integer "variant_id"
    t.integer "option_value_id"
  end

  add_index "option_values_variants", ["option_value_id"], name: "index_option_values_variants_on_option_value_id"
  add_index "option_values_variants", ["variant_id"], name: "index_option_values_variants_on_variant_id"

  create_table "orders", force: true do |t|
    t.string   "number",               limit: 32
    t.integer  "user_id"
    t.decimal  "item_total",                      precision: 10, scale: 2, default: 0.0, null: false
    t.decimal  "total",                           precision: 10, scale: 2, default: 0.0, null: false
    t.string   "currency"
    t.string   "state"
    t.datetime "completed_at"
    t.text     "special_instructions"
    t.integer  "ship_address_id"
    t.integer  "shipping_method_id"
    t.string   "shipment_state"
    t.decimal  "payment_total",                   precision: 10, scale: 2, default: 0.0
    t.string   "payment_state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["completed_at"], name: "index_orders_on_completed_at"
  add_index "orders", ["number"], name: "index_orders_on_number"
  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "payment_methods", force: true do |t|
    t.string   "type"
    t.string   "name"
    t.text     "description"
    t.boolean  "active",      default: true
    t.string   "environment", default: "development"
    t.datetime "deleted_at"
    t.string   "display_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: true do |t|
    t.decimal  "amount"
    t.integer  "order_id"
    t.integer  "source_id"
    t.string   "source_type"
    t.integer  "payment_method_id"
    t.string   "state"
    t.string   "response_code"
    t.string   "avs_response"
    t.string   "identifier"
    t.string   "cvv_response_code"
    t.string   "cvv_response_message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payments", ["order_id"], name: "index_payments_on_order_id"

  create_table "prices", force: true do |t|
    t.integer  "variant_id",                         null: false
    t.string   "currency"
    t.decimal  "amount",     precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_option_types", force: true do |t|
    t.integer  "position"
    t.integer  "product_id"
    t.integer  "option_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_properties", force: true do |t|
    t.string   "value"
    t.integer  "product_id"
    t.integer  "property_id"
    t.integer  "position",    default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_properties", ["product_id"], name: "index_product_properties_on_product_id"

  create_table "products", force: true do |t|
    t.string   "name",                 default: "", null: false
    t.text     "description"
    t.datetime "available_on"
    t.datetime "deleted_at"
    t.string   "permalink"
    t.text     "meta_description"
    t.string   "meta_keywords"
    t.integer  "shipping_category_id"
    t.text     "detail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["available_on"], name: "index_products_on_available_on"
  add_index "products", ["deleted_at"], name: "index_products_on_deleted_at"
  add_index "products", ["name"], name: "index_products_on_name"
  add_index "products", ["permalink"], name: "index_products_on_permalink", unique: true

  create_table "properties", force: true do |t|
    t.string   "name"
    t.string   "presentation", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "properties_prototypes", force: true do |t|
    t.integer  "property_id"
    t.integer  "prototype_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prototypes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at"

  create_table "shipments", force: true do |t|
    t.string   "tracking"
    t.string   "number"
    t.decimal  "cost",       precision: 8, scale: 2
    t.datetime "shipped_at"
    t.integer  "order_id"
    t.integer  "address_id"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shipments", ["number"], name: "index_shipments_on_number"
  add_index "shipments", ["order_id"], name: "index_shipments_on_order_id"

  create_table "shipping_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shipping_method_categories", force: true do |t|
    t.integer  "shipping_method_id",   null: false
    t.integer  "shipping_category_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shipping_method_categories", ["shipping_category_id"], name: "index_shipping_method_categories_on_shipping_category_id"
  add_index "shipping_method_categories", ["shipping_method_id"], name: "index_shipping_method_categories_on_shipping_method_id"

  create_table "shipping_methods", force: true do |t|
    t.string   "name"
    t.datetime "deleted_at"
    t.string   "display_on"
    t.string   "admin_name"
    t.string   "tracking_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shipping_rates", force: true do |t|
    t.integer  "shipment_id"
    t.integer  "shipping_method_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shipping_rates", ["shipment_id", "shipping_method_id"], name: "index_shipping_rates_on_shipment_id_and_shipping_method_id", unique: true
  add_index "shipping_rates", ["shipment_id"], name: "index_shipping_rates_on_shipment_id"

  create_table "shops", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "variants", force: true do |t|
    t.string   "sku",                                   default: "",    null: false
    t.datetime "deleted_at"
    t.integer  "product_id"
    t.integer  "position"
    t.decimal  "weight",        precision: 8, scale: 2
    t.decimal  "height",        precision: 8, scale: 2
    t.decimal  "width",         precision: 8, scale: 2
    t.decimal  "depth",         precision: 8, scale: 2
    t.decimal  "cost_price",    precision: 8, scale: 2
    t.string   "cost_currency"
    t.boolean  "is_master",                             default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "variants", ["product_id"], name: "index_variants_on_product_id"
  add_index "variants", ["sku"], name: "index_variants_on_sku"

end

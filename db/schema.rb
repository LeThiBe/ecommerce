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

ActiveRecord::Schema.define(version: 20180422150707) do

  create_table "average_caches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "rater_id"
    t.string "rateable_type"
    t.bigint "rateable_id"
    t.float "avg", limit: 24, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rateable_type", "rateable_id"], name: "index_average_caches_on_rateable_type_and_rateable_id"
    t.index ["rateable_type"], name: "index_average_caches_on_rateable_type"
    t.index ["rater_id", "rateable_id"], name: "index_average_caches_on_rater_id_and_rateable_id"
    t.index ["rater_id"], name: "index_average_caches_on_rater_id"
  end

  create_table "carts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "parent_id"
  end

  create_table "customers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "product_id"
    t.integer "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity", default: 1
    t.bigint "order_product_id"
    t.index ["order_product_id"], name: "index_line_items_on_order_product_id"
  end

  create_table "order_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "order_id"
    t.bigint "product_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id", "created_at"], name: "index_order_details_on_order_id_and_created_at"
    t.index ["order_id"], name: "index_order_details_on_order_id"
    t.index ["product_id", "created_at"], name: "index_order_details_on_product_id_and_created_at"
    t.index ["product_id"], name: "index_order_details_on_product_id"
  end

  create_table "order_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "email"
    t.text "address"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pay_method"
    t.bigint "user_id"
    t.integer "status", default: 0
    t.index ["user_id"], name: "index_order_products_on_user_id"
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "customer_id"
    t.bigint "pay_id"
    t.float "amount", limit: 24
    t.boolean "status_pay"
    t.boolean "status_ship"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id", "created_at"], name: "index_orders_on_customer_id_and_created_at"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["pay_id", "created_at"], name: "index_orders_on_pay_id_and_created_at"
    t.index ["pay_id"], name: "index_orders_on_pay_id"
    t.index ["user_id", "created_at"], name: "index_orders_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "overall_averages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "rateable_type"
    t.bigint "rateable_id"
    t.float "overall_avg", limit: 24, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rateable_id", "rateable_type"], name: "index_overall_averages_on_rateable_id_and_rateable_type"
    t.index ["rateable_type", "rateable_id"], name: "index_overall_averages_on_rateable_type_and_rateable_id"
  end

  create_table "pays", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pictures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "url_picture"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id", "created_at"], name: "index_pictures_on_product_id_and_created_at"
    t.index ["product_id"], name: "index_pictures_on_product_id"
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.float "price", limit: 24
    t.string "size"
    t.integer "discount"
    t.string "description"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.index ["category_id", "created_at"], name: "index_products_on_category_id_and_created_at"
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "rates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "rater_id"
    t.string "rateable_type"
    t.bigint "rateable_id"
    t.float "stars", limit: 24, null: false
    t.string "dimension"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type"
    t.index ["rateable_type", "rateable_id"], name: "index_rates_on_rateable_type_and_rateable_id"
    t.index ["rater_id"], name: "index_rates_on_rater_id"
  end

  create_table "rating_caches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "cacheable_type"
    t.bigint "cacheable_id"
    t.float "avg", limit: 24, null: false
    t.integer "qty", null: false
    t.string "dimension"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type"
    t.index ["cacheable_type", "cacheable_id"], name: "index_rating_caches_on_cacheable_type_and_cacheable_id"
  end

  create_table "reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "star"
    t.string "conten"
    t.bigint "product_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id", "created_at"], name: "index_reviews_on_product_id_and_created_at"
    t.index ["product_id"], name: "index_reviews_on_product_id"
    t.index ["user_id", "created_at"], name: "index_reviews_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "suggests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.integer "status"
    t.string "name"
    t.float "price", limit: 24
    t.string "picture"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_suggests_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_suggests_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.boolean "activated", default: false
    t.string "phone"
    t.string "address"
    t.integer "point", default: 0
    t.boolean "is_admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "activation_digest"
    t.datetime "activated_at"
    t.string "remember_digest"
  end

  add_foreign_key "line_items", "order_products"
  add_foreign_key "order_details", "orders"
  add_foreign_key "order_details", "products"
  add_foreign_key "order_products", "users"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "pays"
  add_foreign_key "orders", "users"
  add_foreign_key "pictures", "products"
  add_foreign_key "products", "categories"
  add_foreign_key "reviews", "products"
  add_foreign_key "reviews", "users"
  add_foreign_key "suggests", "users"
end

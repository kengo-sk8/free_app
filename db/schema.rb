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

ActiveRecord::Schema.define(version: 2020_04_28_020312) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "postal_code", null: false
    t.string "prefecture_code", null: false
    t.string "city_name", null: false
    t.string "street", null: false
    t.string "street2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "customer_id", null: false
    t.string "card_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.text "comment", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_comments_on_item_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "item_images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "item_id"
    t.string "image", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_images_on_item_id"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", null: false
    t.text "name", null: false
    t.string "content"
    t.string "price", null: false
    t.integer "prefecture_code", null: false
    t.integer "status", default: 0, null: false
    t.bigint "deliverymethod_id", null: false
    t.bigint "deliveryburden_id", null: false
    t.bigint "deliverydate_id", null: false
    t.bigint "brand_id", null: false
    t.bigint "upper_category_id", null: false
    t.bigint "middle_category_id", null: false
    t.bigint "lower_category_id", null: false
    t.bigint "size_id", null: false
    t.bigint "seller_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_items_on_brand_id"
    t.index ["deliveryburden_id"], name: "index_items_on_deliveryburden_id"
    t.index ["deliverydate_id"], name: "index_items_on_deliverydate_id"
    t.index ["deliverymethod_id"], name: "index_items_on_deliverymethod_id"
    t.index ["lower_category_id"], name: "index_items_on_lower_category_id"
    t.index ["middle_category_id"], name: "index_items_on_middle_category_id"
    t.index ["seller_id"], name: "index_items_on_seller_id"
    t.index ["size_id"], name: "index_items_on_size_id"
    t.index ["upper_category_id"], name: "index_items_on_upper_category_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "nickname", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_kana", null: false
    t.string "last_name_kana", null: false
    t.string "phone_number"
    t.integer "birthday_year_id", null: false
    t.integer "birthday_moon_id", null: false
    t.integer "birthday_day_id", null: false
    t.text "self_introduce"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "item_images", "items"
end

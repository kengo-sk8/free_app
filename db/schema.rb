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

ActiveRecord::Schema.define(version: 2020_04_23_074156) do

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_kana", null: false
    t.string "last_name_kana", null: false
    t.string "email", null: false
    t.string "phone_number"
    t.string "password", null: false
    t.integer "birthday_year_id", null: false
    t.integer "birthday_moon_id", null: false
    t.integer "birthday_day_id", null: false
    t.text "self_introduce"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

ActiveRecord::Schema.define(version: 0) do

end

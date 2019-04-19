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

ActiveRecord::Schema.define(version: 2019_04_13_125339) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus", force: :cascade do |t|
    t.bigint "stylist_id"
    t.string "menu_name", null: false
    t.integer "menu_price", null: false
    t.integer "operation_time", null: false
    t.string "content", null: false
    t.text "memo", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stylist_id"], name: "index_menus_on_stylist_id"
  end

  create_table "prefectures", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "salon_reservation_id"
    t.bigint "stylist_reservation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "menu_id"
    t.boolean "finish_salon", default: false
    t.boolean "finish_stylist", default: false
    t.string "salon_memo"
    t.string "stylist_memo"
    t.index ["menu_id"], name: "index_reservations_on_menu_id"
    t.index ["salon_reservation_id"], name: "index_reservations_on_salon_reservation_id"
    t.index ["stylist_reservation_id"], name: "index_reservations_on_stylist_reservation_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "salon_reservations", force: :cascade do |t|
    t.bigint "salon_id"
    t.datetime "book_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["salon_id"], name: "index_salon_reservations_on_salon_id"
  end

  create_table "salons", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "prefecture_id", null: false
    t.string "manage", null: false
    t.string "tel", null: false
    t.integer "num_of_stylists", null: false
    t.integer "num_of_sheets", null: false
    t.string "features", null: false
    t.integer "cut_price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "place", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["category_id"], name: "index_salons_on_category_id"
    t.index ["email"], name: "index_salons_on_email", unique: true
    t.index ["prefecture_id"], name: "index_salons_on_prefecture_id"
    t.index ["reset_password_token"], name: "index_salons_on_reset_password_token", unique: true
  end

  create_table "stylist_reservations", force: :cascade do |t|
    t.bigint "stylist_id"
    t.datetime "book_time", null: false
    t.string "memo", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "operation_time", null: false
    t.index ["stylist_id"], name: "index_stylist_reservations_on_stylist_id"
  end

  create_table "stylists", force: :cascade do |t|
    t.bigint "salon_id"
    t.bigint "category_id"
    t.string "name", null: false
    t.string "tel", null: false
    t.integer "stylist_since", null: false
    t.string "activity_scope", null: false
    t.integer "cut_price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "features", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["category_id"], name: "index_stylists_on_category_id"
    t.index ["email"], name: "index_stylists_on_email", unique: true
    t.index ["reset_password_token"], name: "index_stylists_on_reset_password_token", unique: true
    t.index ["salon_id"], name: "index_stylists_on_salon_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "tel", null: false
    t.integer "birth_year", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "menus", "stylists"
  add_foreign_key "reservations", "menus"
  add_foreign_key "reservations", "salon_reservations"
  add_foreign_key "reservations", "stylist_reservations"
  add_foreign_key "reservations", "users"
  add_foreign_key "salon_reservations", "salons"
  add_foreign_key "salons", "categories"
  add_foreign_key "salons", "prefectures"
  add_foreign_key "stylist_reservations", "stylists"
  add_foreign_key "stylists", "categories"
  add_foreign_key "stylists", "salons"
end

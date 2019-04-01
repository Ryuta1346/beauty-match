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

ActiveRecord::Schema.define(version: 2019_04_01_135614) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prefectures", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "salons", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "prefecture_id"
    t.string "manage"
    t.string "tel"
    t.string "email"
    t.integer "num_of_stylists"
    t.integer "num_of_sheets"
    t.string "features"
    t.integer "cut_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "place"
    t.index ["category_id"], name: "index_salons_on_category_id"
    t.index ["prefecture_id"], name: "index_salons_on_prefecture_id"
  end

  create_table "stylists", force: :cascade do |t|
    t.bigint "salon_id"
    t.bigint "category_id"
    t.string "name"
    t.string "tel"
    t.string "email"
    t.date "stylist_since"
    t.string "activity_scope"
    t.integer "cut_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "features"
    t.index ["category_id"], name: "index_stylists_on_category_id"
    t.index ["salon_id"], name: "index_stylists_on_salon_id"
  end

  add_foreign_key "salons", "categories"
  add_foreign_key "salons", "prefectures"
  add_foreign_key "stylists", "categories"
  add_foreign_key "stylists", "salons"
end

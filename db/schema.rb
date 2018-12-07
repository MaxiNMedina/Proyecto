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

ActiveRecord::Schema.define(version: 2018_12_06_150254) do

  create_table "auctions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "residence_id"
    t.integer "maxbid"
    t.date "dateStart"
    t.date "dateEnd"
    t.integer "user_id"
    t.integer "availability_id"
    t.index ["availability_id"], name: "index_auctions_on_availability_id"
    t.index ["residence_id"], name: "index_auctions_on_residence_id"
    t.index ["user_id"], name: "index_auctions_on_user_id"
  end

  create_table "auctions_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "auction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auction_id"], name: "index_auctions_users_on_auction_id"
    t.index ["user_id"], name: "index_auctions_users_on_user_id"
  end

  create_table "availabilities", force: :cascade do |t|
    t.integer "residence_id"
    t.integer "year"
    t.integer "week"
    t.boolean "is_available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["residence_id"], name: "index_availabilities_on_residence_id"
  end

  create_table "hotsales", force: :cascade do |t|
    t.integer "residence_id"
    t.integer "availability_id"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["availability_id"], name: "index_hotsales_on_availability_id"
    t.index ["residence_id"], name: "index_hotsales_on_residence_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "residence_id"
    t.integer "user_id"
    t.integer "year"
    t.integer "week"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price"
    t.index ["residence_id"], name: "index_reservations_on_residence_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "residences", force: :cascade do |t|
    t.string "name"
    t.string "dir"
    t.text "desc"
    t.boolean "available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
    t.string "country"
    t.string "province"
    t.string "locality"
  end

  create_table "searches", force: :cascade do |t|
    t.string "keywords"
    t.string "dir"
    t.string "desc"
    t.string "country"
    t.string "province"
    t.string "locality"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settings", force: :cascade do |t|
    t.integer "user_fee"
    t.integer "premium_user_fee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.integer "credits"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "isAdmin"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "userName"
    t.integer "isPremium"
    t.integer "reservation_id"
    t.string "name"
    t.string "surname"
    t.date "birthday"
    t.bigint "credit_card_number"
    t.integer "cvv"
    t.date "card_expiry_date"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reservation_id"], name: "index_users_on_reservation_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end

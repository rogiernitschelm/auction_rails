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

ActiveRecord::Schema.define(version: 20170513194022) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auctions", force: :cascade do |t|
    t.string   "title",                                   null: false
    t.text     "description",                             null: false
    t.decimal  "starting_price", precision: 10, scale: 2, null: false
    t.decimal  "buyout_price",   precision: 10, scale: 2
    t.integer  "seller_id",                               null: false
    t.datetime "expires_at",                              null: false
    t.datetime "finished_at"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["seller_id"], name: "index_auctions_on_seller_id", using: :btree
  end

  create_table "bids", force: :cascade do |t|
    t.decimal  "amount",     precision: 10, scale: 2, null: false
    t.integer  "buyer_id",                            null: false
    t.integer  "auction_id",                          null: false
    t.datetime "placed_at",                           null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["auction_id"], name: "index_bids_on_auction_id", using: :btree
    t.index ["buyer_id"], name: "index_bids_on_buyer_id", using: :btree
  end

  create_table "buyers", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "company_id"
    t.index ["company_id"], name: "index_buyers_on_company_id", using: :btree
    t.index ["user_id"], name: "index_buyers_on_user_id", using: :btree
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name",                                            null: false
    t.string   "country",             default: "The Netherlands", null: false
    t.string   "telephone",                                       null: false
    t.string   "email",                                           null: false
    t.string   "city",                                            null: false
    t.string   "address",                                         null: false
    t.string   "business",                                        null: false
    t.string   "chamber_of_commerce",                             null: false
    t.boolean  "verified",            default: false,             null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  create_table "complaints", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_complaints_on_user_id", using: :btree
  end

  create_table "sellers", force: :cascade do |t|
    t.integer  "user_id",                    null: false
    t.boolean  "verified",   default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "company_id"
    t.index ["company_id"], name: "index_sellers_on_company_id", using: :btree
    t.index ["user_id"], name: "index_sellers_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                           null: false
    t.string   "password_digest",                 null: false
    t.string   "first_name",                      null: false
    t.string   "last_name",                       null: false
    t.string   "infix"
    t.string   "city"
    t.string   "birth_date"
    t.string   "gender"
    t.boolean  "admin",           default: false, null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_foreign_key "complaints", "users"
end

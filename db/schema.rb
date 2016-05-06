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

ActiveRecord::Schema.define(version: 20160505140301) do

  create_table "accessories", force: :cascade do |t|
    t.string   "acc_name"
    t.string   "variant"
    t.integer  "product_id"
    t.integer  "price"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "acc_avatar_file_name"
    t.string   "acc_avatar_content_type"
    t.integer  "acc_avatar_file_size"
    t.datetime "acc_avatar_updated_at"
  end

  add_index "accessories", ["product_id"], name: "index_accessories_on_product_id"

  create_table "events", force: :cascade do |t|
    t.string   "event_name"
    t.string   "event_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id"

  create_table "fittings", force: :cascade do |t|
    t.integer  "height"
    t.integer  "pant_size"
    t.integer  "shrit_size"
    t.integer  "weight"
    t.string   "shoe_size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "look_id"
    t.integer  "user_id"
  end

  create_table "looks", force: :cascade do |t|
    t.string   "name"
    t.string   "neckwear"
    t.string   "shirts"
    t.string   "shoes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "product_id"
    t.string   "price"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "quantity"
    t.integer  "look_id"
    t.integer  "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "status"
    t.integer  "total"
    t.integer  "vat"
    t.integer  "user_id"
    t.string   "transaction_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.string   "name"
    t.string   "contact_no"
    t.text     "address"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

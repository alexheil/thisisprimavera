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

ActiveRecord::Schema.define(version: 20170531220358) do

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.string   "image"
    t.text     "subtitle"
    t.text     "content"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_posts_on_slug"
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.text     "mini_description"
    t.string   "element"
    t.integer  "base_price"
    t.integer  "shipping_price"
    t.integer  "total_price"
    t.integer  "quantity"
    t.text     "cause"
    t.integer  "amount_to_product"
    t.integer  "amount_to_cause"
    t.integer  "amount_to_company"
    t.string   "size"
    t.string   "color"
    t.string   "image1"
    t.string   "image2"
    t.string   "image3"
    t.string   "slug"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["slug"], name: "index_products_on_slug"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name",        default: ""
    t.text     "description", default: ""
    t.string   "location",    default: ""
    t.integer  "air",         default: 0
    t.integer  "earth",       default: 0
    t.integer  "water",       default: 0
    t.integer  "solar",       default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",               default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "slug",                   default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_users_on_slug", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end

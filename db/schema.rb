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

ActiveRecord::Schema.define(version: 20141012062939) do

  create_table "customers", force: true do |t|
    t.string   "name"
    t.string   "trait"
    t.integer  "affluence"
    t.integer  "staff_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "days", force: true do |t|
    t.integer  "day_number",              default: 1
    t.integer  "average_staff_happiness"
    t.integer  "average_productivity"
    t.integer  "income"
    t.integer  "expenses"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "money"
  end

  create_table "players", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "money"
    t.string   "name"
    t.integer  "base_income"
  end

  add_index "players", ["email"], name: "index_players_on_email", unique: true
  add_index "players", ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true

  create_table "staffs", force: true do |t|
    t.string   "name"
    t.integer  "happiness"
    t.integer  "salary"
    t.integer  "performance"
    t.string   "trait_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "base_performance"
  end

  create_table "trait_hates", force: true do |t|
    t.string   "who_hates"
    t.string   "what_hates"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trait_likes", force: true do |t|
    t.string   "who_likes"
    t.string   "what_likes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "traits", force: true do |t|
    t.string   "name"
    t.integer  "modifier"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "money",                  default: 5000
    t.integer  "base_income",            default: 3000
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

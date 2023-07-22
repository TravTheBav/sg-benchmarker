# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_07_22_234051) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attack_benchmarks", force: :cascade do |t|
    t.time "time"
    t.string "map"
    t.text "notes"
    t.string "match_outcome"
    t.string "build_order"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_attack_benchmarks_on_user_id"
  end

  create_table "build_order_steps", force: :cascade do |t|
    t.string "supply"
    t.string "unit"
    t.text "description"
    t.bigint "build_order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["build_order_id"], name: "index_build_order_steps_on_build_order_id"
  end

  create_table "build_orders", force: :cascade do |t|
    t.string "name"
    t.string "faction"
    t.text "notes"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_build_orders_on_user_id"
  end

  create_table "units", force: :cascade do |t|
    t.string "unit_type"
    t.integer "quantity"
    t.bigint "attack_benchmark_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attack_benchmark_id"], name: "index_units_on_attack_benchmark_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "attack_benchmarks", "users"
  add_foreign_key "build_order_steps", "build_orders"
  add_foreign_key "build_orders", "users"
  add_foreign_key "units", "attack_benchmarks"
end

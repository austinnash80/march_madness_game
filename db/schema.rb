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

ActiveRecord::Schema[7.0].define(version: 2023_03_14_093409) do
  create_table "group_members", force: :cascade do |t|
    t.integer "group_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.integer "buy_in"
    t.string "note_1"
    t.string "note_2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "auto_draft_complete"
    t.boolean "live_draft_complete"
    t.string "draft_order"
    t.integer "draft_order_1"
    t.integer "draft_order_2"
    t.integer "draft_order_3"
    t.integer "draft_order_4"
    t.boolean "live_draft_start"
    t.boolean "auto_draft_start"
  end

  create_table "picks", force: :cascade do |t|
    t.integer "group_id"
    t.integer "user_id"
    t.integer "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.integer "seed"
    t.string "region"
    t.boolean "w1"
    t.boolean "w2"
    t.boolean "w3"
    t.boolean "w4"
    t.boolean "w5"
    t.boolean "w6"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end

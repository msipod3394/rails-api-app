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

ActiveRecord::Schema[7.0].define(version: 2024_04_08_001824) do
  create_table "dislikes", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "ingredient_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "fk_rails_f1bdd3ed82"
    t.index ["user_id"], name: "fk_rails_4381bad317"
  end

  create_table "favorites", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "fk_rails_30ac764a96"
    t.index ["user_id"], name: "fk_rails_d15744e438"
  end

  create_table "ingredient_items", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "ingredient_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_ingredient_items_on_ingredient_id"
    t.index ["item_id"], name: "index_ingredient_items_on_item_id"
  end

  create_table "ingredients", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_ingredients_on_name", unique: true
  end

  create_table "items", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "image", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_items_on_name", unique: true
  end

  create_table "orders", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "fk_rails_fc971cd604"
    t.index ["user_id"], name: "fk_rails_f868b47f6a"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "password", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "user_name"
    t.string "email", default: "", null: false
    t.string "reset_password_token"
    t.string "jti", null: false
  end

  add_foreign_key "dislikes", "ingredients"
  add_foreign_key "dislikes", "users", on_delete: :cascade
  add_foreign_key "favorites", "items"
  add_foreign_key "favorites", "users", on_delete: :cascade
  add_foreign_key "ingredient_items", "ingredients"
  add_foreign_key "ingredient_items", "items"
  add_foreign_key "orders", "items"
end

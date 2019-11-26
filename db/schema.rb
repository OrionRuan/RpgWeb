# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_25_223823) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "historia", force: :cascade do |t|
    t.string "nome"
    t.text "texto"
    t.string "imagem"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "opcaos", force: :cascade do |t|
    t.bigint "paihistoria_id"
    t.bigint "filhahistoria_id"
    t.text "texto"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["filhahistoria_id"], name: "index_opcaos_on_filhahistoria_id"
    t.index ["paihistoria_id"], name: "index_opcaos_on_paihistoria_id"
  end

  create_table "user_historia", force: :cascade do |t|
    t.bigint "historia_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["historia_id"], name: "index_user_historia_on_historia_id"
    t.index ["user_id"], name: "index_user_historia_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "opcaos", "historia", column: "filhahistoria_id"
  add_foreign_key "opcaos", "historia", column: "paihistoria_id"
  add_foreign_key "user_historia", "historia", column: "historia_id"
  add_foreign_key "user_historia", "users"
end

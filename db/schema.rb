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

ActiveRecord::Schema.define(version: 2019_11_23_192607) do

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

  add_foreign_key "opcaos", "historia", column: "filhahistoria_id"
  add_foreign_key "opcaos", "historia", column: "paihistoria_id"
end

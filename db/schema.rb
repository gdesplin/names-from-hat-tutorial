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

ActiveRecord::Schema[7.1].define(version: 2024_03_25_210246) do
  create_table "drawings", force: :cascade do |t|
    t.integer "hat_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hat_id", "name"], name: "index_drawings_on_hat_id_and_name", unique: true
    t.index ["hat_id"], name: "index_drawings_on_hat_id"
  end

  create_table "hats", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "name_matches", force: :cascade do |t|
    t.integer "drawing_id", null: false
    t.integer "giver_id", null: false
    t.integer "receiver_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drawing_id", "giver_id"], name: "index_name_matches_on_drawing_id_and_giver_id", unique: true
    t.index ["drawing_id", "receiver_id"], name: "index_name_matches_on_drawing_id_and_receiver_id", unique: true
    t.index ["drawing_id"], name: "index_name_matches_on_drawing_id"
    t.index ["giver_id"], name: "index_name_matches_on_giver_id"
    t.index ["receiver_id"], name: "index_name_matches_on_receiver_id"
  end

  create_table "names", force: :cascade do |t|
    t.integer "hat_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hat_id", "name"], name: "index_names_on_hat_id_and_name", unique: true
    t.index ["hat_id"], name: "index_names_on_hat_id"
  end

  add_foreign_key "drawings", "hats"
  add_foreign_key "name_matches", "drawings"
  add_foreign_key "name_matches", "names", column: "giver_id"
  add_foreign_key "name_matches", "names", column: "receiver_id"
  add_foreign_key "names", "hats"
end

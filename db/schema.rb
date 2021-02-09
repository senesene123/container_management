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

ActiveRecord::Schema.define(version: 2020_10_19_115357) do

  create_table "companies", primary_key: "company_id", id: :string, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "company_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rfid_containers", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "container_id"
    t.date "entering_date"
    t.date "leaving_date"
    t.string "contents", null: false
    t.string "contents_size"
    t.string "from_place"
    t.string "to_place"
    t.boolean "entering_flg", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contents"], name: "fk_rails_5a1563f4ac"
    t.index ["from_place"], name: "fk_rails_79f46c4c66"
    t.index ["to_place"], name: "fk_rails_ae054f4579"
  end

  create_table "vegetables", primary_key: "vegetable_id", id: :string, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "vegetable_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "rfid_containers", "companies", column: "from_place", primary_key: "company_id"
  add_foreign_key "rfid_containers", "companies", column: "to_place", primary_key: "company_id"
  add_foreign_key "rfid_containers", "vegetables", column: "contents", primary_key: "vegetable_id"
end

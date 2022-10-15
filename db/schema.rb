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

ActiveRecord::Schema.define(version: 2022_10_15_164205) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "squads", force: :cascade do |t|
    t.string "game"
    t.string "day"
    t.string "time"
    t.integer "number_players"
    t.boolean "competitive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_games", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_games_on_user_id"
  end

  create_table "user_squads", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "squad_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["squad_id"], name: "index_user_squads_on_squad_id"
    t.index ["user_id"], name: "index_user_squads_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "gamertag"
    t.string "platform"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "user_games", "users"
  add_foreign_key "user_squads", "squads"
  add_foreign_key "user_squads", "users"
end

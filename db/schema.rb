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

ActiveRecord::Schema.define(version: 20160422232220) do

  create_table "cards", force: :cascade do |t|
    t.text     "text",       null: false
    t.string   "type",       null: false
    t.integer  "pick"
    t.integer  "draw"
    t.integer  "deck_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "decks", force: :cascade do |t|
    t.string   "title",       null: false
    t.string   "series"
    t.boolean  "official"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "decks_games", id: false, force: :cascade do |t|
    t.integer "deck_id"
    t.integer "game_id"
  end

  add_index "decks_games", ["deck_id"], name: "index_decks_games_on_deck_id"
  add_index "decks_games", ["game_id"], name: "index_decks_games_on_game_id"

  create_table "games", force: :cascade do |t|
    t.integer  "win_threshold", default: 10
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "games_players", force: :cascade do |t|
    t.integer "deck_id"
    t.integer "game_id"
  end

  add_index "games_players", ["deck_id"], name: "index_games_players_on_deck_id"
  add_index "games_players", ["game_id"], name: "index_games_players_on_game_id"

  create_table "players", force: :cascade do |t|
    t.integer  "points",     default: 0
    t.integer  "game_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end

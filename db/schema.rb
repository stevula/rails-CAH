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

ActiveRecord::Schema.define(version: 20160505211231) do

  create_table "cards", force: :cascade do |t|
    t.text     "text",       null: false
    t.string   "type",       null: false
    t.integer  "pick"
    t.integer  "draw"
    t.integer  "deck_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards_discard_piles", id: false, force: :cascade do |t|
    t.integer "card_id"
    t.integer "discard_pile_id"
  end

  create_table "cards_draw_piles", id: false, force: :cascade do |t|
    t.integer "card_id"
    t.integer "draw_pile_id"
  end

  create_table "decks", force: :cascade do |t|
    t.string   "title",       null: false
    t.string   "series"
    t.boolean  "official"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "discard_piles", force: :cascade do |t|
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "discard_piles", ["game_id"], name: "index_discard_piles_on_game_id"

  create_table "draw_piles", force: :cascade do |t|
    t.string   "type",       null: false
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "draw_piles", ["game_id"], name: "index_draw_piles_on_game_id"

  create_table "games", force: :cascade do |t|
    t.integer  "win_threshold", default: 10
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "games_players", id: false, force: :cascade do |t|
    t.integer "game_id"
    t.integer "player_id"
  end

  add_index "games_players", ["game_id"], name: "index_games_players_on_game_id"
  add_index "games_players", ["player_id"], name: "index_games_players_on_player_id"

  create_table "players", force: :cascade do |t|
    t.integer  "points",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end

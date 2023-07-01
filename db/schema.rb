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

ActiveRecord::Schema.define(version: 2023_07_01_164121) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bet_leagues", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "owner_id"
    t.integer "status"
    t.text "description"
    t.integer "league_type", default: 0
    t.index ["owner_id"], name: "index_bet_leagues_on_owner_id"
  end

  create_table "bet_matches", force: :cascade do |t|
    t.integer "round_id"
    t.integer "home_player_id"
    t.integer "visitor_player_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "home_score"
    t.integer "visitor_score"
    t.integer "winner_player_id"
  end

  create_table "bets", force: :cascade do |t|
    t.integer "game_id"
    t.integer "home_bet"
    t.integer "visitor_bet"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "player_round_assignment_id"
    t.integer "bet_score"
    t.boolean "nailed"
    t.index ["game_id"], name: "index_bets_on_game_id"
    t.index ["player_round_assignment_id"], name: "index_bets_on_player_round_assignment_id"
  end

  create_table "championships", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "games", force: :cascade do |t|
    t.integer "home_id"
    t.integer "visitor_id"
    t.integer "home_score"
    t.integer "visitor_score"
    t.datetime "date_time"
    t.integer "championship_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "round_id"
    t.integer "position"
    t.index ["home_id"], name: "index_games_on_home_id"
    t.index ["round_id"], name: "index_games_on_round_id"
    t.index ["visitor_id"], name: "index_games_on_visitor_id"
  end

  create_table "player_bet_leagues", force: :cascade do |t|
    t.integer "player_id"
    t.integer "bet_league_id"
    t.integer "player_accumulated_score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "nailed_count"
    t.index ["bet_league_id"], name: "index_player_bet_leagues_on_bet_league_id"
    t.index ["player_id"], name: "index_player_bet_leagues_on_player_id"
  end

  create_table "player_round_assignments", force: :cascade do |t|
    t.integer "round_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "round_score"
    t.integer "nailed_count"
    t.integer "player_bet_league_id"
    t.integer "bet_match_id"
    t.index ["player_bet_league_id"], name: "index_player_round_assignments_on_player_bet_league_id"
    t.index ["round_id"], name: "index_player_round_assignments_on_round_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "user_type"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.datetime "locked_at"
    t.string "unlock_token"
    t.index ["confirmation_token"], name: "index_players_on_confirmation_token", unique: true
    t.index ["email"], name: "index_players_on_email", unique: true
    t.index ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_players_on_unlock_token", unique: true
  end

  create_table "rounds", force: :cascade do |t|
    t.integer "bet_league_id"
    t.integer "round_number"
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "accept_bets_after"
    t.datetime "accept_bets_until"
    t.integer "phase", default: 0
    t.index ["bet_league_id"], name: "index_rounds_on_bet_league_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "logo_url"
    t.boolean "active"
    t.index ["name"], name: "index_teams_on_name"
  end

  add_foreign_key "bet_leagues", "players", column: "owner_id"
  add_foreign_key "bet_matches", "players", column: "home_player_id"
  add_foreign_key "bet_matches", "players", column: "visitor_player_id"
  add_foreign_key "bet_matches", "players", column: "winner_player_id"
  add_foreign_key "bet_matches", "rounds"
  add_foreign_key "bets", "games"
  add_foreign_key "bets", "player_round_assignments"
  add_foreign_key "games", "rounds"
  add_foreign_key "games", "teams", column: "home_id"
  add_foreign_key "games", "teams", column: "visitor_id"
  add_foreign_key "player_bet_leagues", "bet_leagues"
  add_foreign_key "player_bet_leagues", "players"
  add_foreign_key "player_round_assignments", "bet_matches"
  add_foreign_key "player_round_assignments", "player_bet_leagues"
  add_foreign_key "player_round_assignments", "rounds"
  add_foreign_key "rounds", "bet_leagues"
end

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

ActiveRecord::Schema.define(version: 2021_06_26_233505) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bet_cup_phases", force: :cascade do |t|
    t.integer "bet_cup_id"
    t.integer "phase_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bet_cup_rounds", force: :cascade do |t|
    t.integer "bet_cup_id"
    t.integer "bet_cup_phase_id"
    t.integer "round_number"
    t.datetime "accept_bets_after"
    t.datetime "accept_bets_until"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bet_cups", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.integer "owner_id"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bet_leagues", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "owner_id"
    t.integer "status"
    t.text "description"
  end

  create_table "bet_matches", force: :cascade do |t|
    t.integer "bet_cup_id"
    t.integer "bet_cup_round_id"
    t.integer "home_player_id"
    t.integer "visitor_player_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bets", force: :cascade do |t|
    t.integer "game_id"
    t.integer "player_id"
    t.integer "player_score"
    t.integer "bet_league_id"
    t.integer "home_bet"
    t.integer "visitor_bet"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "player_round_assignment_id"
    t.integer "bet_score"
    t.boolean "nailed"
    t.integer "player_bet_match_id"
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
    t.integer "bet_league_id"
    t.integer "position"
    t.index ["round_id"], name: "index_games_on_round_id"
  end

  create_table "player_bet_cup_phase_assignments", force: :cascade do |t|
    t.integer "bet_cup_id"
    t.integer "bet_cup_phase_id"
    t.integer "player_id"
    t.boolean "passed_through"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "player_bet_leagues", force: :cascade do |t|
    t.integer "player_id"
    t.integer "bet_league_id"
    t.integer "player_accumulated_score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "nailed_count"
  end

  create_table "player_bet_matches", force: :cascade do |t|
    t.integer "player_id"
    t.integer "bet_match_id"
    t.integer "score"
    t.integer "nailed_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "player_round_assignments", force: :cascade do |t|
    t.integer "bet_league_id"
    t.integer "player_id"
    t.integer "round_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "round_score"
    t.integer "nailed_count"
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
    t.index ["email"], name: "index_players_on_email", unique: true
    t.index ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true
  end

  create_table "rounds", force: :cascade do |t|
    t.integer "bet_league_id"
    t.integer "round_number"
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "accept_bets_after"
    t.datetime "accept_bets_until"
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

end

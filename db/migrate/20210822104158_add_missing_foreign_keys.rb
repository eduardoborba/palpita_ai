# frozen_string_literal: true

class AddMissingForeignKeys < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :games, :teams, column: :home_id
    add_index :games, :home_id

    add_foreign_key :games, :teams, column: :visitor_id
    add_index :games, :visitor_id

    add_foreign_key :games, :rounds

    add_foreign_key :bets, :games
    add_index :bets, :game_id

    add_foreign_key :bets, :player_round_assignments
    add_index :bets, :player_round_assignment_id

    add_foreign_key :bet_leagues, :players, column: :owner_id
    add_index :bet_leagues, :owner_id

    add_foreign_key :rounds, :bet_leagues
    add_index :rounds, :bet_league_id

    add_foreign_key :player_bet_leagues, :bet_leagues
    add_index :player_bet_leagues, :bet_league_id

    add_foreign_key :player_bet_leagues, :players
    add_index :player_bet_leagues, :player_id

    add_foreign_key :player_round_assignments, :players
    add_index :player_round_assignments, :player_id

    add_foreign_key :player_round_assignments, :rounds
    add_index :player_round_assignments, :round_id
  end
end

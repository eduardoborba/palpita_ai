# frozen_string_literal: true

class NormalizeTables < ActiveRecord::Migration[6.0]
  def up
    remove_column :bets, :player_id
    remove_column :bets, :bet_league_id

    remove_column :player_round_assignments, :bet_league_id
    remove_column :player_round_assignments, :player_id
    add_column :player_round_assignments, :player_bet_league_id, :integer
    add_foreign_key :player_round_assignments, :player_bet_leagues
    add_index :player_round_assignments, :player_bet_league_id

    remove_column :games, :bet_league_id

    remove_column :bet_matches, :bet_cup_id
  end

  def down
    add_column :bets, :player_id, :integer
    add_column :bets, :bet_league_id, :integer

    add_column :player_round_assignments, :bet_league_id, :integer
    add_column :player_round_assignments, :player_id, :integer
    remove_column :player_round_assignments, :player_bet_league_id
    remove_foreign_key :player_round_assignments, :player_bet_leagues
    remove_index :player_round_assignments, :player_bet_league_id

    add_column :games, :bet_league_id, :integer

    add_column :bet_matches, :bet_cup_id, :integer
  end
end

class NormalizeTables < ActiveRecord::Migration[6.0]
  def change
    remove_column :bets, :player_id
    remove_column :bets, :bet_league_id

    remove_column :player_round_assignments, :bet_league_id

    remove_column :games, :bet_league_id

    remove_column :bet_matches, :bet_cup_id
  end
end

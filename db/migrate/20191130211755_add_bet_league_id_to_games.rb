# frozen_string_literal: true

class AddBetLeagueIdToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :bet_league_id, :integer
  end
end

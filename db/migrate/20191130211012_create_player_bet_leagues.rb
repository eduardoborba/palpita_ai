# frozen_string_literal: true

class CreatePlayerBetLeagues < ActiveRecord::Migration[6.0]
  def change
    create_table :player_bet_leagues do |t|
      t.integer :player_id
      t.integer :bet_league_id
      t.integer :player_accumulated_score

      t.timestamps
    end
  end
end

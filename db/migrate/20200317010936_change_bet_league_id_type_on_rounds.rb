# frozen_string_literal: true

class ChangeBetLeagueIdTypeOnRounds < ActiveRecord::Migration[6.0]
  def change
    change_column :rounds, :bet_league_id, :integer, using: 'bet_league_id::integer'
  end
end

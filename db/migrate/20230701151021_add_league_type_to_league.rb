# frozen_string_literal: true

class AddLeagueTypeToLeague < ActiveRecord::Migration[6.1]
  def change
    add_column :bet_leagues, :league_type, :integer, default: 0
  end
end

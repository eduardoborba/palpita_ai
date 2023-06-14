# frozen_string_literal: true

class RemoveNumberOfGamesFromRound < ActiveRecord::Migration[6.0]
  def change
    remove_column :rounds, :number_of_games
  end
end

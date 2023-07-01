# frozen_string_literal: true

class AddMoreColumnsToBetMatches < ActiveRecord::Migration[6.1]
  def change
    add_column :bet_matches, :home_score, :integer
    add_column :bet_matches, :visitor_score, :integer
    add_column :bet_matches, :winner_player_id, :integer

    add_foreign_key :bet_matches, :players, column: :winner_player_id
  end
end

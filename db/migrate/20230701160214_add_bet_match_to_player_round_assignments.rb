# frozen_string_literal: true

class AddBetMatchToPlayerRoundAssignments < ActiveRecord::Migration[6.1]
  def change
    add_column :player_round_assignments, :bet_match_id, :integer

    add_foreign_key :player_round_assignments, :bet_matches
  end
end

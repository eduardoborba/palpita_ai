# frozen_string_literal: true

class CreatePlayerRoundAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :player_round_assignments do |t|
      t.integer :bet_league_id
      t.integer :player_id
      t.integer :round_id

      t.timestamps
    end
  end
end

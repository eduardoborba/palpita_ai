# frozen_string_literal: true

class CleanupBetCup < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :rounds, :bet_cups
    remove_foreign_key :player_bet_cup_phase_assignments, :bet_cups
    remove_foreign_key :bet_cup_phases, :bet_cups

    remove_column :rounds, :bet_cup_id

    drop_table :bet_cups
  end
end

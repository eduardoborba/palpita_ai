# frozen_string_literal: true

class CleanupBetPhases < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :player_bet_cup_phase_assignments, :bet_cup_phases
    remove_foreign_key :rounds, :bet_cup_phases

    remove_column :rounds, :bet_cup_phase_id

    drop_table :bet_cup_phases
  end
end

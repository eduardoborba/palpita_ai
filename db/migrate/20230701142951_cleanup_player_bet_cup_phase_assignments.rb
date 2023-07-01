# frozen_string_literal: true

class CleanupPlayerBetCupPhaseAssignments < ActiveRecord::Migration[6.1]
  def change
    drop_table :player_bet_cup_phase_assignments
  end
end

# frozen_string_literal: true

class AddBetCupAndPhaseToRounds < ActiveRecord::Migration[6.0]
  def change
    add_column :rounds, :bet_cup_id, :integer
    add_column :rounds, :bet_cup_phase_id, :integer

    add_foreign_key :rounds, :bet_cups
    add_foreign_key :rounds, :bet_cup_phases
  end
end

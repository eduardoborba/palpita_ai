class CreatePlayerBetCupPhaseAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :player_bet_cup_phase_assignments do |t|
      t.integer :bet_cup_id
      t.integer :bet_cup_phase_id
      t.integer :player_id
      t.boolean :passed_through

      t.timestamps
    end
  end
end

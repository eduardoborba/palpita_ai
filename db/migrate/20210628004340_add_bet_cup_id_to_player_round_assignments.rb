class AddBetCupIdToPlayerRoundAssignments < ActiveRecord::Migration[6.0]
  def change
    add_column :player_round_assignments, :bet_cup_id, :integer

    add_foreign_key :player_round_assignments, :bet_cups
  end
end

class AddPlayerRoundAssignmentToBet < ActiveRecord::Migration[6.0]
  def change
    add_column :bets, :player_round_assignment_id, :integer
  end
end

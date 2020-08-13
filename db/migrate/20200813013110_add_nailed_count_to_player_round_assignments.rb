class AddNailedCountToPlayerRoundAssignments < ActiveRecord::Migration[6.0]
  def change
    add_column :player_round_assignments, :nailed_count, :integer
  end
end

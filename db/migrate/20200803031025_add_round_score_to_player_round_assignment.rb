class AddRoundScoreToPlayerRoundAssignment < ActiveRecord::Migration[6.0]
  def change
    add_column :player_round_assignments, :round_score, :integer
  end
end

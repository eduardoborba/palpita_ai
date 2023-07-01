class RemoveUnusedColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :bets, :player_score
  end
end

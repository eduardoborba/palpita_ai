class AddRoundIdToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :round_id, :integer
  end
end

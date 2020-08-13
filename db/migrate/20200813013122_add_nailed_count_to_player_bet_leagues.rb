class AddNailedCountToPlayerBetLeagues < ActiveRecord::Migration[6.0]
  def change
    add_column :player_bet_leagues, :nailed_count, :integer
  end
end

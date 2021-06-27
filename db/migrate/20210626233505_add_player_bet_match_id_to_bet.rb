class AddPlayerBetMatchIdToBet < ActiveRecord::Migration[6.0]
  def change
    add_column :bets, :player_bet_match_id, :integer
  end
end

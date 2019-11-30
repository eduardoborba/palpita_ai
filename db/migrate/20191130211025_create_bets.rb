class CreateBets < ActiveRecord::Migration[6.0]
  def change
    create_table :bets do |t|
      t.integer :game_id
      t.integer :player_id
      t.integer :player_score
      t.integer :bet_league_id
      t.integer :home_bet
      t.integer :visitor_bet

      t.timestamps
    end
  end
end

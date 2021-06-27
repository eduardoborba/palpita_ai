class CreateBetMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :bet_matches do |t|
      t.integer :bet_cup_id
      t.integer :bet_cup_round_id
      t.integer :home_player_id
      t.integer :visitor_player_id

      t.timestamps
    end
  end
end

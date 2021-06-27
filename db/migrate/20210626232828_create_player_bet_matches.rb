class CreatePlayerBetMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :player_bet_matches do |t|
      t.integer :player_id
      t.integer :bet_match_id
      t.integer :score
      t.integer :nailed_count

      t.timestamps
    end
  end
end

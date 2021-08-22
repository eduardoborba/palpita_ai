class CreateBetMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :bet_matches do |t|
      t.integer :bet_cup_id
      t.integer :round_id
      t.integer :home_player_id
      t.integer :visitor_player_id

      t.timestamps
    end

    add_foreign_key :bet_matches, :bet_cups
    add_foreign_key :bet_matches, :rounds
    add_foreign_key :bet_matches, :players, column: :home_player_id
    add_foreign_key :bet_matches, :players, column: :visitor_player_id
  end
end

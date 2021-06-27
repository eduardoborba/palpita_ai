class CreateBetCupRounds < ActiveRecord::Migration[6.0]
  def change
    create_table :bet_cup_rounds do |t|
      t.integer :bet_cup_id
      t.integer :bet_cup_phase_id
      t.integer :round_number
      t.datetime :accept_bets_after
      t.datetime :accept_bets_until

      t.timestamps
    end
  end
end

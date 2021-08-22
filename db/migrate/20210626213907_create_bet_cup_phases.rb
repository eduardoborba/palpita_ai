class CreateBetCupPhases < ActiveRecord::Migration[6.0]
  def change
    create_table :bet_cup_phases do |t|
      t.integer :bet_cup_id
      t.integer :phase_type

      t.timestamps
    end

    add_foreign_key :bet_cup_phases, :bet_cups
  end
end

class CreateBetLeagues < ActiveRecord::Migration[6.0]
  def change
    create_table :bet_leagues do |t|
      t.string :name

      t.timestamps
    end
  end
end

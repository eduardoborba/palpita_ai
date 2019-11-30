class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :home_id
      t.integer :visitor_id
      t.integer :home_score
      t.integer :visitor_score
      t.datetime :date_time
      t.integer :championship_id

      t.timestamps
    end
  end
end

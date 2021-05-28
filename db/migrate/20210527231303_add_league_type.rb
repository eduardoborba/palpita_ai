class AddLeagueType < ActiveRecord::Migration[6.0]
  def change
    add_column :bet_leagues, :league_type, :integer
  end
end

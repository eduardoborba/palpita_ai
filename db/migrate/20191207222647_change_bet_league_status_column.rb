class ChangeBetLeagueStatusColumn < ActiveRecord::Migration[6.0]
  def up
    rename_column :bet_leagues, :status_id, :status
  end

  def down
    rename_column :bet_leagues, :status, :status_id
  end
end

class AddStatusIdToBetLeagues < ActiveRecord::Migration[6.0]
  def change
    add_column :bet_leagues, :status_id, :integer
  end
end

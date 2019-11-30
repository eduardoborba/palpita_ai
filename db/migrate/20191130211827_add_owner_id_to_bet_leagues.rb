class AddOwnerIdToBetLeagues < ActiveRecord::Migration[6.0]
  def change
    add_column :bet_leagues, :owner_id, :integer
  end
end

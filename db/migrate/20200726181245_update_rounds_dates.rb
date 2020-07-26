class UpdateRoundsDates < ActiveRecord::Migration[6.0]
  def change
    remove_column :rounds, :blocked_after
    add_column :rounds, :accept_bets_after, :datetime
    add_column :rounds, :accept_bets_until, :datetime
  end
end

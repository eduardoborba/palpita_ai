class ChangeRoundsStatusColumnAgain < ActiveRecord::Migration[6.0]
  def change
    change_column :rounds, :status, :integer, default: 0
  end
end

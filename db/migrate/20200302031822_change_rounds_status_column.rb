# frozen_string_literal: true

class ChangeRoundsStatusColumn < ActiveRecord::Migration[6.0]
  def up
    rename_column :rounds, :status_id, :status
  end

  def down
    rename_column :rounds, :status, :status_id
  end
end

# frozen_string_literal: true

class AddPositionToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :position, :integer
  end
end

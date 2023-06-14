# frozen_string_literal: true

class AddIndexToGames < ActiveRecord::Migration[6.0]
  def change
    add_index :games, :round_id
  end
end

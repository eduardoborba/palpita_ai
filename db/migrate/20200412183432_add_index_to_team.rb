# frozen_string_literal: true

class AddIndexToTeam < ActiveRecord::Migration[6.0]
  def change
    add_index :teams, :name
  end
end

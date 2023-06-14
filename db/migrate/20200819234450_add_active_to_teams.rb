# frozen_string_literal: true

class AddActiveToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :active, :boolean
  end
end

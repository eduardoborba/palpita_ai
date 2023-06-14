# frozen_string_literal: true

class AddLogoToTeam < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :logo_url, :string
  end
end

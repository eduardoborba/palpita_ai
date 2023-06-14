# frozen_string_literal: true

class AddDescriptionToLeague < ActiveRecord::Migration[6.0]
  def change
    add_column :bet_leagues, :description, :text
  end
end

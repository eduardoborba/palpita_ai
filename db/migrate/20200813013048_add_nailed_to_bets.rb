# frozen_string_literal: true

class AddNailedToBets < ActiveRecord::Migration[6.0]
  def change
    add_column :bets, :nailed, :boolean
  end
end

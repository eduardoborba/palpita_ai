# frozen_string_literal: true

class AddBetScoreToBets < ActiveRecord::Migration[6.0]
  def change
    add_column :bets, :bet_score, :integer
  end
end

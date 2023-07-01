# frozen_string_literal: true

class AddPhaseToRounds < ActiveRecord::Migration[6.1]
  def change
    add_column :rounds, :phase, :integer, default: 0
  end
end

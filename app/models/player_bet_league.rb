# frozen_string_literal: true

class PlayerBetLeague < ApplicationRecord
  belongs_to :player
  belongs_to :bet_league
  has_many :player_round_assignments, dependent: :destroy
end

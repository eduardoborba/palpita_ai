# frozen_string_literal: true

class BetCupRound < ApplicationRecord
  belongs_to :bet_cup
  belongs_to :bet_cup_phase
end

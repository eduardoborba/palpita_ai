# frozen_string_literal: true

class BetCupPhase < ApplicationRecord
  belongs_to :bet_cup

  has_many :bet_cup_rounds

  enum phase_type: { group_phase: 0, round_of_16: 1, quarter_final: 2, semi_final: 3, final: 4 }
end

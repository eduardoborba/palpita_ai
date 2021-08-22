class BetCupPhase < ApplicationRecord
  belongs_to :bet_cup

  has_many :bet_cup_rounds

  enum phase_type: %i[
    group_phase
    round_of_16
    quarter_final
    semi_final
    final
  ]
end

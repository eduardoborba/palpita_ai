class BetCupPhase < ApplicationRecord
  belongs_to :bet_cup

  has_many :bet_cup_rounds
end

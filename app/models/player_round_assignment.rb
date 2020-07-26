class PlayerRoundAssignment < ApplicationRecord
  belongs_to :player
  belongs_to :round
  belongs_to :bet_league
  has_many :bets
end

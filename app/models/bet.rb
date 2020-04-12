class Bet < ApplicationRecord
  belongs_to :player_round_assignment
  belongs_to :player
  belongs_to :bet_league
  belongs_to :game
end

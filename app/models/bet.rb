class Bet < ApplicationRecord
  belongs_to :player_round_assignment
  belongs_to :player
  belongs_to :bet_league
  belongs_to :game

  validates :player_round_assignment_id, :player_id, :bet_league_id, :game_id, presence: true
end

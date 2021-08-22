class Bet < ApplicationRecord
  belongs_to :player_round_assignment, optional: true
  belongs_to :player
  belongs_to :bet_league, optional: true
  belongs_to :game
  belongs_to :player_bet_match, optional: true

  validates :player_id, :bet_league_id,
            :game_id, :home_bet, :visitor_bet, presence: true
  validates :home_bet, :visitor_bet, numericality: { greater_than_or_equal_to: 0 }
end

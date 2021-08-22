class Bet < ApplicationRecord
  belongs_to :player_round_assignment
  belongs_to :game

  validates :player_round_assignment, :game_id, :home_bet, :visitor_bet, presence: true
  validates :home_bet, :visitor_bet, numericality: { greater_than_or_equal_to: 0 }
end

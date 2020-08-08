class Game < ApplicationRecord
  belongs_to :bet_league
  belongs_to :round
  belongs_to :home, class_name: 'Team'
  belongs_to :visitor, class_name: 'Team'
  has_many :bets

  validates :home_id, :visitor_id, presence: true
  validates :home_score, :visitor_score, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
  validates :home_score, :visitor_score, presence: true, if: -> { round.finished? }
end

class Round < ApplicationRecord
  has_many :games
  belongs_to :bet_league
  has_many :player_round_assignments

  accepts_nested_attributes_for :games, allow_destroy: true

  enum status: %i[unstarted started finished]

  before_create :fill_round_number

  validates :games, :accept_bets_after, :accept_bets_until, presence: true

  def fill_round_number
    self.round_number = (self.bet_league.rounds.maximum(:round_number) || 0) + 1
  end
end

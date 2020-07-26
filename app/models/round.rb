class Round < ApplicationRecord
  include TranslateEnum

  has_many :games
  belongs_to :bet_league
  has_many :player_round_assignments

  accepts_nested_attributes_for :games, allow_destroy: true

  enum status: { unstarted: 0, started: 1, finished: 2 }
  translate_enum :status

  before_create :fill_round_number

  validates :games, :accept_bets_after, :accept_bets_until, presence: true

  def fill_round_number
    self.round_number = (self.bet_league.rounds.maximum(:round_number) || 0) + 1
  end
end

class Round < ApplicationRecord
  include TranslateEnum

  has_many :games, dependent: :destroy
  has_many :player_round_assignments, dependent: :destroy
  belongs_to :bet_league, optional: true
  belongs_to :bet_cup, optional: true

  accepts_nested_attributes_for :games, allow_destroy: true

  enum status: { unstarted: 0, open: 1, closed: 2, finished: 3 }
  translate_enum :status

  before_create :fill_round_number

  validates :games, :accept_bets_after, :accept_bets_until, presence: true
  validates_associated :games

  def fill_round_number
    self.round_number = (self.bet_league.rounds.maximum(:round_number) || 0) + 1
  end
end

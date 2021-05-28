class BetLeague < ApplicationRecord
  include TranslateEnum

  belongs_to :owner, class_name: 'Player'
  has_many :player_bet_leagues, dependent: :destroy
  has_many :players, through: :player_bet_leagues
  has_many :rounds
  has_many :games

  validates :name, uniqueness: true, presence: true

  enum status: [:unstarted, :started, :finished]
  enum league_type: [:league, :cup, :playoffs]

  translate_enum :league_type
end

class BetLeague < ApplicationRecord
  belongs_to :owner, class_name: 'Player'
  has_many :player_bet_leagues, dependent: :destroy
  has_many :players, through: :player_bet_leagues
end

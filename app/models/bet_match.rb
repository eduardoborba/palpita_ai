class BetMatch < ApplicationRecord
  belongs_to :home_player, class_name: 'Player'
  belongs_to :visitor_player, class_name: 'Player'
  belongs_to :bet_cup
  belongs_to :bet_cup_round
end

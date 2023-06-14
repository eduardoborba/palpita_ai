# frozen_string_literal: true

class BetMatch < ApplicationRecord
  belongs_to :home_player, class_name: 'Player'
  belongs_to :visitor_player, class_name: 'Player'
  belongs_to :bet_cup
  belongs_to :round
end

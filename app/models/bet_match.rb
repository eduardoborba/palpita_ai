# frozen_string_literal: true

class BetMatch < ApplicationRecord
  belongs_to :home_player, class_name: 'Player'
  belongs_to :visitor_player, class_name: 'Player'
  belongs_to :winner_player, class_name: 'Player'
  belongs_to :round
  has_many :player_round_assignemnts
end

class BetCup < ApplicationRecord
  belongs_to :owner, class_name: 'Player'

  has_many :bet_cup_phases
  has_many :bet_cup_rounds
  has_many :bet_cup_matches

  enum status: [:unstarted, :started, :finished]
end

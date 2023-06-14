# frozen_string_literal: true

class BetCup < ApplicationRecord
  belongs_to :owner, class_name: 'Player'

  has_many :bet_cup_phases
  has_many :bet_cup_rounds
  has_many :bet_cup_matches
  has_many :rounds

  enum status: { unstarted: 0, started: 1, finished: 2 }
end

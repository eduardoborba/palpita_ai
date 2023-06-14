# frozen_string_literal: true

class BetLeague < ApplicationRecord
  belongs_to :owner, class_name: 'Player'
  has_many :player_bet_leagues, dependent: :destroy
  has_many :players, through: :player_bet_leagues
  has_many :rounds, dependent: :destroy

  validates :name, uniqueness: true, presence: true

  enum status: { unstarted: 0, started: 1, finished: 2 }
end

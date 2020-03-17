class Round < ApplicationRecord
  has_many :games
  belongs_to :bet_league

  enum status: [:unstarted, :started, :finished]
end

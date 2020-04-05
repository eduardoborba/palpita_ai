class Round < ApplicationRecord
  has_many :games
  belongs_to :bet_league
  accepts_nested_attributes_for :games, allow_destroy: true

  enum status: [:unstarted, :started, :finished]
end

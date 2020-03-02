class Round < ApplicationRecord
  has_many :games

  enum status: [:unstarted, :started, :finished]
end

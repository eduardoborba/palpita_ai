class PlayerBetMatch < ApplicationRecord
  belongs_to :player
  belongs_to :bet_match
end

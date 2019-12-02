class PlayerBetLeague < ApplicationRecord
  belongs_to :player
  belongs_to :bet_league
end

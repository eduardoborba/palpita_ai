class PlayerBetLeague < ApplicationRecord
  belongs_to :player
  belongs_to :bet_league

  def player_round_assignments
    PlayerRoundAssignment.where(player: player, bet_league: bet_league)
  end
end

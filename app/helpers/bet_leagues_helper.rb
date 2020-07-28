module BetLeaguesHelper
  def round_row_url(round)
    if round.unstarted?
      if @bet_league.owner == current_player
        edit_round_path(round)
      else
        '#self'
      end
    elsif round.started?
      if current_player.player_round_assignments.exists?(round: round)
        edit_player_round_assignment_path(current_player.player_round_assignments.find_by(round: round))
      else
        new_player_round_assignment_path(round_id: round.id)
      end
    else
    end
  end
end

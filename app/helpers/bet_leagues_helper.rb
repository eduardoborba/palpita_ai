module BetLeaguesHelper
  def round_row_url(round)
    case round.status
    when 'unstarted'
      league_owner? ? edit_round_path(round) : '#self'
    when 'open'
      if current_player.player_round_assignments.exists?(round: round)
        edit_player_round_assignment_path(
          current_player.player_round_assignments.find_by(round: round)
        )
      else
        new_player_round_assignment_path(round_id: round.id)
      end
    when 'closed'
      if current_player.player_round_assignments.exists?(round: round)
        round_path(round)
      elsif league_owner?
        edit_finish_round_path(round)
      else
        '#self'
      end
    when 'finished'
      round_path(round)
    end
  end

  def league_owner?
    @bet_league.owner == current_player
  end
end

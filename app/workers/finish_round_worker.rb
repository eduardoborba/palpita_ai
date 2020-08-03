# frozen_string_literal: true

require 'sidekiq-scheduler'

class FinishRoundWorker
  include Sidekiq::Worker

  def perform(round_id)
    round = Round.find(round_id)
    player_round_assignments = PlayerRoundAssignment.where(round: round.id)

    PlayerRoundAssignment.transaction do
      player_round_assignments.each do |player_round_assignment|
        score = 0

        player_round_assignment.bets.each do |bet|
          bet.bet_score = points_from_bet(bet)
          bet.save!

          score += bet.bet_score
        end

        player_round_assignment.round_score = score
        player_round_assignment.save!

        player_bet_league = player_round_assignment.player_bet_league
        player_bet_league.player_accumulated_score = player_bet_league.player_round_assignments.sum(:round_score)
        player_bet_league.save!
      end
    end
  end

  private

  def points_from_bet(bet)
    game = bet.game
    bet_winner_side = winner_side(bet.home_bet, bet.visitor_bet)
    game_winner_side = winner_side(game.home_score, game.visitor_score)

    if bet_winner_side == game_winner_side
      winner_bet = game_winner_side == :home ? bet.home_bet : bet.visitor_bet
      loser_bet = game_winner_side == :home ? bet.visitor_bet : bet.home_bet
      winner_score = game_winner_side == :home ? game.home_score : game.visitor_score
      loser_score = game_winner_side == :home ? game.visitor_score : game.home_score

      if winner_bet == winner_score
        if loser_bet == loser_score
          10
        else
          7
        end
      else
        5
      end
    else
      0
    end
  end

  def winner_side(home_score, visitor_score)
    if home_score > visitor_score
      :home
    elsif home_score < visitor_score
      :visitor
    else
      :draw
    end
  end
end

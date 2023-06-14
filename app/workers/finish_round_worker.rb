# frozen_string_literal: true

class FinishRoundWorker
  include Sidekiq::Worker

  def perform(round_id)
    round = Round.find(round_id)
    player_round_assignments = round.player_round_assignments

    PlayerRoundAssignment.transaction do
      player_round_assignments.each do |player_round_assignment|
        player_round_assignment.bets.each do |bet|
          calculate_points_for_bet(bet)
        end

        player_round_assignment.round_score = player_round_assignment.bets.sum(:bet_score)
        player_round_assignment.nailed_count = player_round_assignment.bets.where(nailed: true).count
        player_round_assignment.save!

        player_bet_league = player_round_assignment.player_bet_league
        player_bet_league.player_accumulated_score = player_bet_league.player_round_assignments.sum(:round_score)
        player_bet_league.nailed_count = player_bet_league.player_round_assignments.sum(:nailed_count)
        player_bet_league.save!
      end
    end
  end

  private

  def calculate_points_for_bet(bet)
    game = bet.game
    bet_winner_side = winner_side(bet.home_bet, bet.visitor_bet)
    game_winner_side = winner_side(game.home_score, game.visitor_score)

    if bet_winner_side == game_winner_side
      if game_winner_side == :draw
        calculate_when_guessed_draw(bet, game)
      else
        calculate_when_got_right_side(bet, game, game_winner_side)
      end
    else
      calculate_when_didnt_got_right_side(bet, game)
    end
  end

  def calculate_when_guessed_draw(bet, game)
    if bet.home_bet == game.home_score
      bet.bet_score = 10
      bet.nailed = true
    else
      bet.bet_score = 5
      bet.nailed = false
    end

    bet.save!
  end

  def calculate_when_got_right_side(bet, game, winner_side)
    winner_bet = winner_side == :home ? bet.home_bet : bet.visitor_bet
    loser_bet = winner_side == :home ? bet.visitor_bet : bet.home_bet
    winner_score = winner_side == :home ? game.home_score : game.visitor_score
    loser_score = winner_side == :home ? game.visitor_score : game.home_score

    if winner_bet == winner_score && loser_bet == loser_score
      bet.bet_score = 10
      bet.nailed = true
    elsif winner_bet == winner_score || loser_bet == loser_score
      bet.bet_score = 7
      bet.nailed = false
    else
      bet.bet_score = 4
      bet.nailed = false
    end

    bet.save!
  end

  def calculate_when_didnt_got_right_side(bet, game)
    bet.bet_score = if bet.home_bet == game.home_score || bet.visitor_bet == game.visitor_score
                      1
                    else
                      0
                    end

    bet.nailed = false
    bet.save!
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

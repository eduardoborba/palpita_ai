require 'test_helper'

class FinishRoundWorkerTest < ActiveSupport::TestCase
  setup do
    @round = rounds(:round_1)
    @game1 = @round.games.first
    @game2 = @round.games.second
    @player_round_assignment = player_round_assignments(:obina_bet_to_round_1)
    @player_bet_league = player_bet_leagues(:one)
    @bet1 = @player_round_assignment.bets.find_by(game: @game1)
    @bet2 = @player_round_assignment.bets.find_by(game: @game2)
  end

  # test "the truth" do
  #   assert true
  # end

  test '#perform' do
    @game1.update!(home_score: 2, visitor_score: 1)
    @game2.update!(home_score: 2, visitor_score: 1)
    @bet1.update!(home_bet: 2, visitor_bet: 1)
    @bet2.update!(home_bet: 2, visitor_bet: 0)

    @round.finished!

    assert_equal 0, @player_round_assignment.round_score
    assert_equal 0, @player_bet_league.player_accumulated_score

    FinishRoundWorker.new.perform(@round.id)

    assert_equal 17, @player_round_assignment.reload.round_score
    assert_equal 17, @player_bet_league.reload.player_accumulated_score
  end
end

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

  test '#perform when one nailed and one not nailed' do
    @game1.update!(home_score: 2, visitor_score: 1)
    @game2.update!(home_score: 1, visitor_score: 2)
    @bet1.update!(home_bet: 2, visitor_bet: 1)
    @bet2.update!(home_bet: 0, visitor_bet: 2)

    @round.finished!

    assert_equal 0, @player_round_assignment.round_score
    assert_equal 0, @player_bet_league.player_accumulated_score

    FinishRoundWorker.new.perform(@round.id)

    assert_equal 17, @player_round_assignment.reload.round_score
    assert_equal 1, @player_round_assignment.nailed_count
    assert_equal 17, @player_bet_league.reload.player_accumulated_score
    assert_equal 1, @player_bet_league.nailed_count
  end

  test '#perform when one draw nailed and one draw wrong' do
    @game1.update!(home_score: 1, visitor_score: 1)
    @game2.update!(home_score: 0, visitor_score: 0)
    @bet1.update!(home_bet: 1, visitor_bet: 1)
    @bet2.update!(home_bet: 2, visitor_bet: 1)

    @round.finished!

    assert_equal 0, @player_round_assignment.round_score
    assert_equal 0, @player_bet_league.player_accumulated_score

    FinishRoundWorker.new.perform(@round.id)

    assert_equal 10, @player_round_assignment.reload.round_score
    assert_equal 1, @player_round_assignment.nailed_count
    assert_equal 10, @player_bet_league.reload.player_accumulated_score
    assert_equal 1, @player_bet_league.nailed_count
  end

  test '#perform when one draw with wrong scores and the other is wrong with one score right' do
    @game1.update!(home_score: 1, visitor_score: 1)
    @game2.update!(home_score: 0, visitor_score: 0)
    @bet1.update!(home_bet: 0, visitor_bet: 0)
    @bet2.update!(home_bet: 2, visitor_bet: 0)

    @round.finished!

    assert_equal 0, @player_round_assignment.round_score
    assert_equal 0, @player_bet_league.player_accumulated_score

    FinishRoundWorker.new.perform(@round.id)

    assert_equal 6, @player_round_assignment.reload.round_score
    assert_equal 0, @player_round_assignment.nailed_count
    assert_equal 6, @player_bet_league.reload.player_accumulated_score
    assert_equal 0, @player_bet_league.nailed_count
  end
end

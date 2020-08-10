require 'test_helper'

class FinishRoundsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @round = rounds(:round_1)
    @bet_league = bet_leagues(:camp_do_obina)
    sign_in(players(:obina))
  end

  test 'should block if round is not closed' do
    @round.open!

    get edit_finish_round_url(@round)
    assert_response :redirect
    assert_redirected_to @bet_league
  end

  test 'should get edit' do
    @round.closed!
    get edit_finish_round_url(@round)
    assert_response :success
  end

  test 'should update round' do
    @round.closed!

    patch finish_round_url(@round), params: {
      round: {
        status: 'finished',
        games_attributes: {
          0 => {
            id: @round.games.first.id,
            home_score: 2,
            visitor_score: 1
          },
          1 => {
            id: @round.games.second.id,
            home_score: 1,
            visitor_score: 0
          }
        }
      }
    }

    assert_redirected_to bet_league_url(@bet_league)

    @round.reload
    assert_equal 'finished', @round.status
    assert_equal 2, @round.games.first.home_score
    assert_equal 1, @round.games.first.visitor_score
    assert_equal 1, @round.games.second.home_score
    assert_equal 0, @round.games.second.visitor_score
  end
end

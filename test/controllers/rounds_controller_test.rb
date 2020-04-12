require 'test_helper'

class RoundsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @round = rounds(:one)
    @bet_league = bet_leagues(:camp_do_obina)
    @flamengo = teams(:flamengo)
    @vasco = teams(:vasco)
    @corinthians = teams(:corinthians)
    @sao_paulo = teams(:sao_paulo)
    sign_in(players(:obina))
  end

  test "should get new" do
    get new_round_url, params: { bet_league_id: @round.bet_league_id }
    assert_response :success
  end

  test "should create round" do
    assert_difference('Round.count', +1) do
      assert_difference('Game.count', +2) do
        post rounds_url, params: {
          round: {
            bet_league_id: @bet_league.id,
            blocked_after: '2020-03-29 00:00:00+00',
            games_attributes: {
              0 => {
                home_id: @flamengo.id,
                visitor_id: @vasco.id
              },
              1 => {
                home_id: @corinthians.id,
                visitor_id: @sao_paulo.id
              }
            }
          }
        }
      end
    end

    assert_response :redirect
    assert_redirected_to bet_league_url(@bet_league)

    round = Round.order(created_at: :desc).take
    assert_equal '2020-03-29 00:00:00 UTC', round.blocked_after.to_s
    assert_equal 3, round.round_number
  end

  test "should show round" do
    get round_url(@round)
    assert_response :success
  end

  test "should get edit" do
    get edit_round_url(@round)
    assert_response :success
  end

  test "should update round" do
    assert_no_difference('Round.count') do
      assert_difference('Game.count', -1) do
        patch round_url(@round), params: {
          round: {
            blocked_after: '2020-03-29 00:00:00+00',
            status: @round.status,
            games_attributes: {
              0 => {
                id: @round.games.first.id,
                home_id: @round.games.first.home_id,
                visitor_id: @round.games.first.visitor_id,
                _destroy: '0'
              },
              1 => {
                id: @round.games.second.id,
                home_id: @round.games.second.home_id,
                visitor_id: @round.games.second.visitor_id,
                _destroy: '1'
              }
            }
          }
        }
      end
    end

    assert_redirected_to bet_league_url(@bet_league)
  end

  test "should destroy round" do
    assert_difference('Round.count', -1) do
      delete round_url(@round)
    end

    assert_redirected_to rounds_url
  end
end

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
    assert_difference('Round.count') do
      post rounds_url, params: {
        round_form: {
          bet_league_id: @bet_league.id,
          blocked_after: '2020-03-29 00:00:00+00',
          games: [
            {
              home_id: @flamengo.id,
              visitor_id: @vasco.id
            },
            {
              home_id: @corinthians.id,
              visitor_id: @sao_paulo.id
            }
          ]
        }
      }
    end

    assert_redirected_to round_url(Round.last)
  end

  test "should show round" do
    get round_url(@round)
    assert_response :success
  end

  # test "should get edit" do
  #   get edit_round_url(@round)
  #   assert_response :success
  # end

  # test "should update round" do
  #   patch round_url(@round), params: {
  #     round_form: {
  #       bet_league_id: @round.bet_league_id,
  #       blocked_after: @round.blocked_after,
  #       number_of_games: @round.number_of_games,
  #       round_number: @round.round_number,
  #       status: @round.status
  #     }
  #   }

  #   assert_redirected_to round_url(@round)
  # end

  test "should destroy round" do
    assert_difference('Round.count', -1) do
      delete round_url(@round)
    end

    assert_redirected_to rounds_url
  end
end

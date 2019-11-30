require 'test_helper'

class BetLeaguesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bet_league = bet_leagues(:one)
  end

  test "should get index" do
    get bet_leagues_url
    assert_response :success
  end

  test "should get new" do
    get new_bet_league_url
    assert_response :success
  end

  test "should create bet_league" do
    assert_difference('BetLeague.count') do
      post bet_leagues_url, params: { bet_league: { name: @bet_league.name } }
    end

    assert_redirected_to bet_league_url(BetLeague.last)
  end

  test "should show bet_league" do
    get bet_league_url(@bet_league)
    assert_response :success
  end

  test "should get edit" do
    get edit_bet_league_url(@bet_league)
    assert_response :success
  end

  test "should update bet_league" do
    patch bet_league_url(@bet_league), params: { bet_league: { name: @bet_league.name } }
    assert_redirected_to bet_league_url(@bet_league)
  end

  test "should destroy bet_league" do
    assert_difference('BetLeague.count', -1) do
      delete bet_league_url(@bet_league)
    end

    assert_redirected_to bet_leagues_url
  end
end

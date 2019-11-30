require 'test_helper'

class PlayerBetLeaguesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @player_bet_league = player_bet_leagues(:one)
  end

  test "should get index" do
    get player_bet_leagues_url
    assert_response :success
  end

  test "should get new" do
    get new_player_bet_league_url
    assert_response :success
  end

  test "should create player_bet_league" do
    assert_difference('PlayerBetLeague.count') do
      post player_bet_leagues_url, params: { player_bet_league: { bet_league_id: @player_bet_league.bet_league_id, player_accumulated_score: @player_bet_league.player_accumulated_score, player_id: @player_bet_league.player_id } }
    end

    assert_redirected_to player_bet_league_url(PlayerBetLeague.last)
  end

  test "should show player_bet_league" do
    get player_bet_league_url(@player_bet_league)
    assert_response :success
  end

  test "should get edit" do
    get edit_player_bet_league_url(@player_bet_league)
    assert_response :success
  end

  test "should update player_bet_league" do
    patch player_bet_league_url(@player_bet_league), params: { player_bet_league: { bet_league_id: @player_bet_league.bet_league_id, player_accumulated_score: @player_bet_league.player_accumulated_score, player_id: @player_bet_league.player_id } }
    assert_redirected_to player_bet_league_url(@player_bet_league)
  end

  test "should destroy player_bet_league" do
    assert_difference('PlayerBetLeague.count', -1) do
      delete player_bet_league_url(@player_bet_league)
    end

    assert_redirected_to player_bet_leagues_url
  end
end

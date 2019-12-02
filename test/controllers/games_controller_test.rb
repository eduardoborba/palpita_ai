require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game = games(:one)
    sign_in(players(:obina))
  end

  test "should get index" do
    get games_url
    assert_response :success
  end

  test "should get new" do
    get new_game_url
    assert_response :success
  end

  test "should create game" do
    assert_difference('Game.count') do
      post games_url, params: { game: { championship_id: @game.championship_id, date_time: @game.date_time, home_id: @game.home_id, home_score: @game.home_score, visitor_id: @game.visitor_id, visitor_score: @game.visitor_score } }
    end

    assert_redirected_to game_url(Game.last)
  end

  test "should show game" do
    get game_url(@game)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_url(@game)
    assert_response :success
  end

  test "should update game" do
    patch game_url(@game), params: { game: { championship_id: @game.championship_id, date_time: @game.date_time, home_id: @game.home_id, home_score: @game.home_score, visitor_id: @game.visitor_id, visitor_score: @game.visitor_score } }
    assert_redirected_to game_url(@game)
  end

  test "should destroy game" do
    assert_difference('Game.count', -1) do
      delete game_url(@game)
    end

    assert_redirected_to games_url
  end
end

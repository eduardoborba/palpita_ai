require 'test_helper'

class PlayerBetLeaguesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bet_league = bet_leagues(:camp_do_obina)
    @obina = players(:obina)
    @eduardo = players(:eduardo)
    sign_in(players(:obina))
  end

  test "should get new" do
    get new_player_bet_league_url, params: { bet_league_id: @bet_league.id }
    assert_response :success
  end

  test "should create player_bet_league" do
    assert_difference('PlayerBetLeague.count') do
      post player_bet_leagues_url, params: {
        player_bet_league_form: {
          bet_league_id: @bet_league.id,
          player_ids: [@obina.id, @eduardo.id]
        }
      }
    end

    assert_redirected_to bet_league_url(@bet_league.id)
  end
end

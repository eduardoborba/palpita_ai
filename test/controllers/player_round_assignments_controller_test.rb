require 'test_helper'

class PlayerRoundAssignmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @player_round_assignment = player_round_assignments(:obina_bet_to_round_1)
    @round1 = rounds(:round_1)
    @round2 = rounds(:round_2)
    @game = @round2.games.take
    @bet_league = @round1.bet_league
    @player = players(:obina)
    @player_bet_league = @player.player_bet_leagues.find_by(bet_league: @bet_league)

    PlayerRoundAssignment.where(player_bet_league: @player_bet_league, round: @round2).destroy_all
    sign_in(@player)
  end

  test 'should get new' do
    get new_player_round_assignment_url(round_id: @round1.id)
    assert_response :success
  end

  test 'should create player_round_assignment' do
    assert_difference('PlayerRoundAssignment.count', +1) do
      assert_difference('Bet.count', +1) do
        post player_round_assignments_url, params: {
          player_round_assignment: {
            player_bet_league_id: @player_bet_league.id,
            round_id: @round2.id,
            bets_attributes: [{
              game_id: @game.id,
              home_bet: 1,
              visitor_bet: 0
            }]
          }
        }
      end
    end

    assert_redirected_to bet_league_url(@bet_league)
  end

  test 'should show player_round_assignment' do
    get player_round_assignment_url(@player_round_assignment)
    assert_response :success
  end

  test 'should get edit' do
    get edit_player_round_assignment_url(@player_round_assignment)
    assert_response :success
  end

  test 'should update player_round_assignment' do
    @bet1 = @player_round_assignment.bets.first
    @bet2 = @player_round_assignment.bets.second

    patch player_round_assignment_url(@player_round_assignment), params: {
      player_round_assignment: {
        player_bet_league_id: @player_bet_league.id,
        round_id: @player_round_assignment.round_id,
        bets_attributes: [{
          id: @bet1.id,
          game_id: @bet1.game_id,
          player_round_assignment: @player_round_assignment.id,
          home_bet: 3,
          visitor_bet: 0
        }, {
          id: @bet2.id,
          game_id: @bet2.game_id,
          player_round_assignment: @player_round_assignment.id,
          home_bet: 0,
          visitor_bet: 1
        }]
      }
    }

    assert_redirected_to bet_league_url(@bet_league)
  end
end

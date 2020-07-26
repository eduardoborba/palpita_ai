require 'test_helper'

class PlayerRoundAssignmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @player_round_assignment = player_round_assignments(:one)
  end

  test "should get index" do
    get player_round_assignments_url
    assert_response :success
  end

  test "should get new" do
    get new_player_round_assignment_url
    assert_response :success
  end

  test "should create player_round_assignment" do
    assert_difference('PlayerRoundAssignment.count') do
      post player_round_assignments_url, params: { player_round_assignment: { bet_league_id: @player_round_assignment.bet_league_id, player_id: @player_round_assignment.player_id, round_id: @player_round_assignment.round_id } }
    end

    assert_redirected_to player_round_assignment_url(PlayerRoundAssignment.last)
  end

  test "should show player_round_assignment" do
    get player_round_assignment_url(@player_round_assignment)
    assert_response :success
  end

  test "should get edit" do
    get edit_player_round_assignment_url(@player_round_assignment)
    assert_response :success
  end

  test "should update player_round_assignment" do
    patch player_round_assignment_url(@player_round_assignment), params: { player_round_assignment: { bet_league_id: @player_round_assignment.bet_league_id, player_id: @player_round_assignment.player_id, round_id: @player_round_assignment.round_id } }
    assert_redirected_to player_round_assignment_url(@player_round_assignment)
  end

  test "should destroy player_round_assignment" do
    assert_difference('PlayerRoundAssignment.count', -1) do
      delete player_round_assignment_url(@player_round_assignment)
    end

    assert_redirected_to player_round_assignments_url
  end
end

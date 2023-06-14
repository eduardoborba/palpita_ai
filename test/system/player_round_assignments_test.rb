# frozen_string_literal: true

require 'application_system_test_case'

class PlayerRoundAssignmentsTest < ApplicationSystemTestCase
  setup do
    @player_round_assignment = player_round_assignments(:obina_bet_to_round_1)
  end

  test 'visiting the index' do
    visit player_round_assignments_url
    assert_selector 'h1', text: 'Player Round Assignments'
  end

  test 'creating a Player round assignment' do
    visit player_round_assignments_url
    click_on 'New Player Round Assignment'

    fill_in 'Bet league', with: @player_round_assignment.bet_league_id
    fill_in 'Player', with: @player_round_assignment.player_id
    fill_in 'Round', with: @player_round_assignment.round_id
    click_on 'Create Player round assignment'

    assert_text 'Player round assignment was successfully created'
    click_on 'Back'
  end

  test 'updating a Player round assignment' do
    visit player_round_assignments_url
    click_on 'Edit', match: :first

    fill_in 'Bet league', with: @player_round_assignment.bet_league_id
    fill_in 'Player', with: @player_round_assignment.player_id
    fill_in 'Round', with: @player_round_assignment.round_id
    click_on 'Update Player round assignment'

    assert_text 'Player round assignment was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Player round assignment' do
    visit player_round_assignments_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Player round assignment was successfully destroyed'
  end
end

# frozen_string_literal: true

require 'application_system_test_case'

class PlayerBetLeaguesTest < ApplicationSystemTestCase
  setup do
    @player_bet_league = player_bet_leagues(:one)
  end

  test 'visiting the index' do
    visit player_bet_leagues_url
    assert_selector 'h1', text: 'Player Bet Leagues'
  end

  test 'creating a Player bet league' do
    visit player_bet_leagues_url
    click_on 'New Player Bet League'

    fill_in 'Bet league', with: @player_bet_league.bet_league_id
    fill_in 'Player accumulated score', with: @player_bet_league.player_accumulated_score
    fill_in 'Player', with: @player_bet_league.player_id
    click_on 'Create Player bet league'

    assert_text 'Player bet league was successfully created'
    click_on 'Back'
  end

  test 'updating a Player bet league' do
    visit player_bet_leagues_url
    click_on 'Edit', match: :first

    fill_in 'Bet league', with: @player_bet_league.bet_league_id
    fill_in 'Player accumulated score', with: @player_bet_league.player_accumulated_score
    fill_in 'Player', with: @player_bet_league.player_id
    click_on 'Update Player bet league'

    assert_text 'Player bet league was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Player bet league' do
    visit player_bet_leagues_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Player bet league was successfully destroyed'
  end
end

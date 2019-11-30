require "application_system_test_case"

class BetLeaguesTest < ApplicationSystemTestCase
  setup do
    @bet_league = bet_leagues(:one)
  end

  test "visiting the index" do
    visit bet_leagues_url
    assert_selector "h1", text: "Bet Leagues"
  end

  test "creating a Bet league" do
    visit bet_leagues_url
    click_on "New Bet League"

    fill_in "Name", with: @bet_league.name
    click_on "Create Bet league"

    assert_text "Bet league was successfully created"
    click_on "Back"
  end

  test "updating a Bet league" do
    visit bet_leagues_url
    click_on "Edit", match: :first

    fill_in "Name", with: @bet_league.name
    click_on "Update Bet league"

    assert_text "Bet league was successfully updated"
    click_on "Back"
  end

  test "destroying a Bet league" do
    visit bet_leagues_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bet league was successfully destroyed"
  end
end

require "application_system_test_case"

class ChampionshipsTest < ApplicationSystemTestCase
  setup do
    @championship = championships(:one)
  end

  test "visiting the index" do
    visit championships_url
    assert_selector "h1", text: "Championships"
  end

  test "creating a Championship" do
    visit championships_url
    click_on "New Championship"

    fill_in "Name", with: @championship.name
    click_on "Create Championship"

    assert_text "Championship was successfully created"
    click_on "Back"
  end

  test "updating a Championship" do
    visit championships_url
    click_on "Edit", match: :first

    fill_in "Name", with: @championship.name
    click_on "Update Championship"

    assert_text "Championship was successfully updated"
    click_on "Back"
  end

  test "destroying a Championship" do
    visit championships_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Championship was successfully destroyed"
  end
end

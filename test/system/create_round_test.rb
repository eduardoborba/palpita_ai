# frozen_string_literal: true

require 'application_system_test_case'

class CreateRoundTest < ApplicationSystemTestCase
  test 'create round successfully' do
    sign_in players(:obina)

    visit "/bet_leagues/#{bet_leagues(:camp_do_obina).id}"

    assert_selector 'h1', text: 'Camp do Obina'

    click_on 'Nova Rodada'

    assert_selector 'h1', text: 'Rodada'
  end
end

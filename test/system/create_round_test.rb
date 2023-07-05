# frozen_string_literal: true

require 'application_system_test_case'

class CreateRoundTest < ApplicationSystemTestCase
  setup do
    bet_leagues(:camp_do_obina).rounds.destroy_all
  end

  test 'create round successfully' do
    sign_in players(:obina)

    visit "/bet_leagues/#{bet_leagues(:camp_do_obina).id}"

    assert_selector 'h1', text: 'Camp do Obina'

    click_on 'Nova Rodada'

    assert_selector 'h1', text: 'Rodada'

    find('button[data-id="round_games_attributes_0_home_id"]').click
    assert_selector '.dropdown-menu li', text: 'Flamengo'
    find('.dropdown-menu li', text: 'Flamengo').click

    find('button.dropdown-toggle[data-id="round_games_attributes_0_visitor_id"]').click
    assert_selector '.dropdown-menu li', text: 'Vasco da Gama'
    find('.dropdown-menu li', text: 'Vasco da Gama').click

    click_on 'Criar'

    assert_selector 'div.alert', text: 'Rodada foi criada com sucesso.'

    assert_selector '[data-controller="rounds-list"] .list-group-item', text: 'Rodada #1'
    assert_selector '[data-controller="rounds-list"] .list-group-item', text: '1 jogo'
  end
end

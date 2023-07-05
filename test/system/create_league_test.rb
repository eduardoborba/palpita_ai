# frozen_string_literal: true

require 'application_system_test_case'

class CreateLeagueTest < ApplicationSystemTestCase
  test 'create league successfully' do
    sign_in players(:obina)

    visit '/home'

    assert_selector 'h1', text: 'Ligas'
    assert_selector 'a', text: 'Criar Liga'

    click_on 'Criar Liga'

    assert_selector 'h1', text: 'Criar Liga'
    assert_selector 'label', text: 'Nome:'
    assert_selector 'label', text: 'Descrição:'

    fill_in 'Nome:', with: 'Outro camp do Obina'
    fill_in 'Descrição:', with: 'Esse é o segundo camp do Obina, porque já tem um camp criado nas fixtures'
    click_on 'Criar'

    assert_selector 'div.alert', text: 'Liga foi criada com sucesso, agora convide pessoas para participar da sua liga.'
    assert_selector 'h1', text: 'Participantes'

    find('button.dropdown-toggle').click
    assert_selector '.dropdown-menu li', text: 'Eduardo José de Borba'
    assert_selector '.dropdown-menu li', text: 'João Obina Morinigo'

    find('.dropdown-menu li', text: 'Eduardo José de Borba').click
    find('.dropdown-menu li', text: 'João Obina Morinigo').click
    find('button.dropdown-toggle').click

    click_on 'Salvar'

    assert_selector 'div.alert', text: 'Participantes convidados com sucesso.'
    assert_selector '.list-group-item', text: 'Eduardo José de Borba'
    assert_selector '.list-group-item', text: 'João Obina Morinigo'
  end
end

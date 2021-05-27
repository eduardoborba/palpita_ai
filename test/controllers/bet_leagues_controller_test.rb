require 'test_helper'

class BetLeaguesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bet_league = bet_leagues(:camp_do_obina)
    @player = players(:obina)
    sign_in(@player)
  end

  test 'should get new' do
    get new_bet_league_url
    assert_response :success
  end

  test 'should create bet_league' do
    assert_difference('BetLeague.count', +1) do
      post bet_leagues_url, params: {
        bet_league: {
          name: 'Nova liga daora',
          description: "Essa nova liga possui um prize pool de 150 reais, e vamos ter no total 20 rodadas, duas por semana.\nBoa sorte!"
        }
      }
    end

    @bet_league = BetLeague.last
    assert_redirected_to new_player_bet_league_path(bet_league_id: @bet_league.id)
    assert_equal 'Liga foi criada com sucesso, agora convide pessoas para participar da sua liga.', flash[:notice]

    assert_equal 'Nova liga daora', @bet_league.name
    assert_equal "Essa nova liga possui um prize pool de 150 reais, e vamos ter no total 20 rodadas, duas por semana.\nBoa sorte!", @bet_league.description
  end

  test 'should show bet_league' do
    get bet_league_url(@bet_league)
    assert_response :success
  end

  test 'should get edit' do
    get edit_bet_league_url(@bet_league)
    assert_response :success
  end

  test 'should update bet_league' do
    assert_no_difference('BetLeague.count') do
      patch bet_league_url(@bet_league), params: {
        bet_league: {
          name: 'Nova liga daora',
          description: "Essa nova liga possui um prize pool de 150 reais, e vamos ter no total 20 rodadas, duas por semana.\nBoa sorte!"
        }
      }
    end

    assert_redirected_to bet_league_url(@bet_league)

    @bet_league.reload
    assert_equal 'Nova liga daora', @bet_league.name
    assert_equal "Essa nova liga possui um prize pool de 150 reais, e vamos ter no total 20 rodadas, duas por semana.\nBoa sorte!", @bet_league.description
  end

  test 'should destroy bet_league' do
    assert_difference('BetLeague.count', -1) do
      delete bet_league_url(@bet_league)
    end

    assert_redirected_to bet_leagues_url
  end


  test 'should block when not owner' do
    other_league = bet_leagues(:camp_do_eduardo)
    assert_not_equal other_league.owner, @player

    get edit_bet_league_url(other_league)

    assert_response :redirect
    assert_redirected_to bet_league_url(other_league)
  end


  test 'should block when not admin' do
    @player.standard!

    get new_bet_league_url

    assert_response :redirect
    assert_redirected_to home_index_path
  end
end

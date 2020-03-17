require 'test_helper'

class RoundFormTest < ActiveSupport::TestCase
  setup do
    @bet_league = bet_leagues(:camp_do_obina)
    @form = RoundForm.new(round: Round.new(bet_league_id: @bet_league.id))
    @flamengo = teams(:flamengo)
    @vasco = teams(:vasco)
    @corinthians = teams(:corinthians)
    @sao_paulo = teams(:sao_paulo)
  end

  test '#submit creates records' do
    assert_difference('Round.count', +1) do
      assert_difference('Game.count', +2) do
        @form.submit(
          games: [
            {
              home_id: @flamengo.id,
              visitor_id: @vasco.id
            },
            {
              home_id: @corinthians.id,
              visitor_id: @sao_paulo.id
            }
          ]
        )
      end
    end
  end

  test '#submit create round properly' do
    @form.submit(
      games: [
        {
          home_id: @flamengo.id,
          visitor_id: @vasco.id
        },
        {
          home_id: @corinthians.id,
          visitor_id: @sao_paulo.id
        }
      ]
    )

    @round = @form.round

    assert_equal 3, @round.round_number
    assert_equal 2, @round.number_of_games
    assert_equal 'unstarted', @round.status
    assert_equal @bet_league.id, @round.bet_league_id
  end

  test '#submit create games properly' do
    @form.submit(
      games: [
        {
          home_id: @flamengo.id,
          visitor_id: @vasco.id
        },
        {
          home_id: @corinthians.id,
          visitor_id: @sao_paulo.id
        }
      ]
    )

    @round = @form.round
    @games = @round.games.order(position: :asc)

    assert_equal 1, @games.first.position
    assert_equal @flamengo.id, @games.first.home_id
    assert_equal @vasco.id, @games.first.visitor_id

    assert_equal 2, @games.second.position
    assert_equal @corinthians.id, @games.second.home_id
    assert_equal @sao_paulo.id, @games.second.visitor_id
  end
end

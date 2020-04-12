require 'test_helper'

class RoundTest < ActiveSupport::TestCase
  setup do
    @bet_league = bet_leagues(:camp_do_obina)
  end

  # test "the truth" do
  #   assert true
  # end

  test '#fill_round_number' do
    assert_equal 2, @bet_league.rounds.maximum(:round_number)

    @round = @bet_league.rounds.build
    @round.attributes = {
      'games_attributes' => {
        '0' => {
          'home_id' => teams(:flamengo).id,
          'visitor_id' => teams(:vasco).id
        },
        '1' => {
          'home_id' => teams(:corinthians).id,
          'visitor_id' => teams(:sao_paulo).id
        }
      },
      'blocked_after' => '2020-04-01 9:00:00+00'
    }
    @round.save!

    assert_equal 3, @round.round_number
  end
end

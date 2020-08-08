require 'test_helper'

class CloseBetsWorkerTest < ActiveSupport::TestCase
  setup do
    @round1 = rounds(:round_1)
    @round2 = rounds(:round_2)
  end

  # test "the truth" do
  #   assert true
  # end

  test '#perform' do
    @round1.update!(accept_bets_until: 1.minute.ago, status: 'open')
    @round2.update!(accept_bets_until: 2.hours.from_now, status: 'open')

    CloseBetsWorker.new.perform

    assert_equal 'closed', @round1.reload.status
    assert_equal 'open', @round2.reload.status
  end
end

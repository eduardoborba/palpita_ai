# frozen_string_literal: true

require 'test_helper'

class OpenBetsWorkerTest < ActiveSupport::TestCase
  setup do
    @round1 = rounds(:round_1)
    @round2 = rounds(:round_2)
  end

  # test "the truth" do
  #   assert true
  # end

  test '#perform' do
    @round1.update!(accept_bets_after: 1.minute.ago, status: 'unstarted')
    @round2.update!(accept_bets_after: 2.hours.from_now, status: 'unstarted')

    OpenBetsWorker.new.perform

    assert_equal 'open', @round1.reload.status
    assert_equal 'unstarted', @round2.reload.status
  end
end

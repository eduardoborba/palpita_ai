# frozen_string_literal: true

require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'sets user type on creation' do
    player = Player.new(
      name: 'Homer Simpson',
      email: 'homer.simpson@gmail.com',
      password: 'N0Pa$word'
    )
    assert_nil player.user_type

    player.skip_confirmation!
    player.save!
    player.reload

    assert_equal 'standard', player.user_type
  end
end

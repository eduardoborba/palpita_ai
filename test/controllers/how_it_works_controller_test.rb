# frozen_string_literal: true

require 'test_helper'

class HowItWorksControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in(players(:obina))
  end

  test 'should get index' do
    get how_it_works_path
    assert_response :success
  end
end

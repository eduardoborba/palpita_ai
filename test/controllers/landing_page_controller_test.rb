# frozen_string_literal: true

require 'test_helper'

class LandingPageControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get landing_page_index_path
    assert_response :success
  end
end

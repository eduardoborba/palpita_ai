require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in(players(:obina))
  end

  test "should get index" do
    get home_index_path
    assert_response :success
  end
end

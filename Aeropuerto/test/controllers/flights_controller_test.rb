require 'test_helper'

class FlightsControllerTest < ActionController::TestCase
  test "should get find" do
    get :find
    assert_response :success
  end

  test "should get select" do
    get :select
    assert_response :success
  end

end

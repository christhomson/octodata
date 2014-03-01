require 'test_helper'

class ActivityControllerTest < ActionController::TestCase
  setup do
    session[:username] = users(:joe).username
  end

  test "should get index" do
    get :index
    assert_response :success
  end
end

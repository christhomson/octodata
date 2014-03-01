require 'test_helper'

class RepositoriesControllerTest < ActionController::TestCase
  setup do
    ApplicationController.any_instance.stubs(:current_user).returns(users(:joe))
  end

  test "#index should load successfully" do
    get :index

    assert_response :ok
    assert_template :index
  end
end

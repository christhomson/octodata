require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:joe)
  end

  test "should require a username" do
    @user.username = nil

    refute @user.valid?, "User should require a username, but it doesn't."
  end

  test "should require an auth token" do
    @user.auth_token = nil

    refute @user.valid?, "User should require an auth token, but it doesn't."
  end

  test "#from_auth should initialize a user object fully with OmniAuth's hash" do
    omniauth_hash = {
      info: {
        nickname: 'jane'
      },
      credentials: {
        token: '4e7676aeaad595016d4f70113b157b6db37082cf'
      }
    }

    user = User.from_auth(omniauth_hash)

    assert user.valid?
    assert_equal omniauth_hash[:info][:nickname], user.username
    assert_equal omniauth_hash[:credentials][:token], user.auth_token
  end
end

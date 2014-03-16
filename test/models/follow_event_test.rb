require 'test_helper'

class FollowEventTest < ActiveSupport::TestCase
  setup do
    @event = events(:follow)
  end

  test "should be valid" do
    assert @event.valid?
  end

  test "should require a target user" do
    @event.target_user = nil

    refute @event.valid?, "FollowEvent should require a target user, but it didn't."
  end
end

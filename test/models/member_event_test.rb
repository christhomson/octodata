require 'test_helper'

class MemberEventTest < ActiveSupport::TestCase
  setup do
    @event = events(:member)
  end

  test "should be valid" do
    assert @event.valid?
  end

  test "should require an action" do
    @event.action = nil

    refute @event.valid?, "MemberEvent should require an action, but it didn't."
  end

  test "should require a repository" do
    @event.repository = nil

    refute @event.valid?, "MemberEvent should require a repository, but it didn't."
  end
  
  test "should require a target user" do
    @event.target_user = nil

    refute @event.valid?, "MemberEvent should require a target user, but it didn't."
  end
end

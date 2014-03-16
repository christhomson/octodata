require 'test_helper'

class ReleaseEventTest < ActiveSupport::TestCase
  setup do
    @event = events(:release)
  end

  test "should be valid" do
    assert @event.valid?
  end

  test "should require an action" do
    @event.action = nil

    refute @event.valid?, "ReleaseEvent should require an action, but it didn't."
  end

  test "should require a repository" do
    @event.repository = nil

    refute @event.valid?, "ReleaseEvent should require a repository, but it didn't."
  end
  
  test "should require a release" do
    @event.release = nil

    refute @event.valid?, "ReleaseEvent should require a release, but it didn't."
  end
end

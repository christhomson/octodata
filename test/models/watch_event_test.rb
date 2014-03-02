require 'test_helper'

class WatchEventTest < ActiveSupport::TestCase
  setup do
    @event = events(:watch)
  end

  test "should require a repository" do
    @event.repository = nil

    refute @event.valid?, "WatchEvent should require a repository, but it didn't."
  end

  test "should have an action" do
    @event.action = nil

    refute @event.valid?, "WatchEvent should require an action, but it didn't."
  end

  test "should have an action description" do
    assert @event.action_description.present?, "WatchEvent should have an action description."
  end
end

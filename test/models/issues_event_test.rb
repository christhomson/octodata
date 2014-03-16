require 'test_helper'

class IssuesEventTest < ActiveSupport::TestCase
  setup do
    @event = events(:issues)
  end

  test "should be valid" do
    assert @event.valid?
  end

  test "should require a repository" do
    @event.repository = nil

    refute @event.valid?, "IssuesEvent should require a repository, but it didn't."
  end

  test "should require an issue" do
    @event.issue = nil

    refute @event.valid?, "IssuesEvent should require a repository, but it didn't."
  end

  test "should require an action" do
    @event.action = nil

    refute @event.valid?, "IssuesEvent should require an action, but it didn't."
  end
end

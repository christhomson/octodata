require 'test_helper'

class PullRequestEventTest < ActiveSupport::TestCase
  setup do
    @event = events(:pull_request)
  end

  test "should be valid" do
    assert @event.valid?
  end

  test "should require a repository" do
    @event.repository = nil

    refute @event.valid?, "PullRequestEvent should require a repository, but it didn't."
  end

  test "should require a pull request" do
    @event.pull_request = nil

    refute @event.valid?, "PullRequestEvent should require a pull request, but it didn't."
  end

  test "should require an action" do
    @event.action = nil

    refute @event.valid?, "PullRequestEvent should require an action, but it didn't."
  end
end

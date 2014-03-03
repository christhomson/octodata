require 'test_helper'

class IssueCommentEventTest < ActiveSupport::TestCase
  setup do
    @event = events(:issue_comment)
  end

  test "should be valid" do
    assert @event.valid?
  end

  test "should require a repository" do
    @event.repository = nil

    refute @event.valid?, "IssueCommentEvent should require a repository, but it didn't."
  end

  test "should require a comment" do
    @event.comment = nil

    refute @event.valid?, "IssueCommentEvent should require a comment, but it didn't."
  end

  test "should require an issue" do
    @event.issue = nil

    refute @event.valid?, "IssueCommentEvent should require an issue, but it didn't."
  end

  test "should have an action description" do
    assert @event.action_description.present?, "IssueCommentEvent should have an action description, but it didn't."
  end
end

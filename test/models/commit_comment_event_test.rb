require 'test_helper'

class CommitCommentEventTest < ActiveSupport::TestCase
  setup do
    @event = events(:commit_comment)
  end

  test "should require a comment" do
    @event.comment = nil

    refute @event.valid?, "CommitCommentEvent should require a comment, but it didn't."
  end

  test "should require a unique comment" do
    refute @event.dup.valid?, "CommitCommentEvent should require a unique comment."
  end

  test "should have an action description" do
    assert @event.action_description.present?, "CommitCommentEvent should have an action description, but it didn't."
  end
end
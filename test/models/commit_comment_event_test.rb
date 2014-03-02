require 'test_helper'

class CommitCommentEventTest < ActiveSupport::TestCase
  setup do
    @event = commit_comment_events(:bad_style)
  end

  test "should require a comment" do
    @event.comment = nil

    refute @event.valid?, "CommitCommentEvent should require a comment, but it didn't."
  end

  test "should require a unique comment" do
    refute @event.dup.valid?, "CommitCommentEvent should require a unique comment."
  end
end

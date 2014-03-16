require 'test_helper'

class PullRequestReviewCommentEventTest < ActiveSupport::TestCase
  setup do
    @event = events(:pull_request_review_comment)
  end

  test "should be valid" do
    assert @event.valid?
  end

  test "should require a comment" do
    @event.comment = nil

    refute @event.valid?, "PullRequestReviewCommentEvent should require a comment, but it didn't."
  end
end

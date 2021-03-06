require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  setup do
    @comment = comments(:bad_style)
  end

  test "should be valid" do
    assert @comment.valid?
  end

  test "should require an HTML url" do
    @comment.html_url = nil

    refute @comment.valid?, "Comment should require an HTML url, but it didn't."
  end

  test "should require a url" do
    @comment.url = nil

    refute @comment.valid?, "Comment should require a url, but it didn't."
  end

  test "should require a remote_id" do
    @comment.remote_id = nil

    refute @comment.valid?, "Comment should require a remote_id, but it didn't."
  end

  test "should require a body" do
    @comment.body = nil

    refute @comment.valid?, "Comment should require a body, but it didn't."
  end
end

require 'test_helper'

class IssueTest < ActiveSupport::TestCase
  setup do
    @issue = issues(:rails)
  end

  test "should be valid" do
    assert @issue.valid?
  end

  test "should have a number" do
    @issue.number = nil

    refute @issue.valid?, "Issue should require a number, but it didn't."
  end

  test "should require a unique number" do
    refute @issue.dup.valid?, "Issue should require a unique number, but it didn't."
  end

  test "should only require a unique number scoped to the repository" do
    pr = @issue.dup
    pr.repository = repositories(:angular)

    assert pr.valid?, "Issue should be valid since the number is unique scoped to the repository."
  end

  test "should require a state" do
    @issue.state = nil

    refute @issue.valid?, "Issue should require a state, but it didn't."
  end

  test "should require a title" do
    @issue.title = nil

    refute @issue.valid?, "Issue should require a title, but it didn't."
  end

  test "should not require a body" do
    @issue.body = nil

    assert @issue.valid?, "Issue should not require a body, but it did."
  end

  test "should require a remote_created_at date" do
    @issue.remote_created_at = nil

    refute @issue.valid?, "Issue should require a remote_created_at date, but it didn't."
  end

  test "should not require a closed_at date" do
    @issue.closed_at = nil

    assert @issue.valid?, "Issue should not require a closed_at date, but it did."
  end

  test "should require a repository" do
    @issue.repository = nil

    refute @issue.valid?, "Issue should require a repository, but it didn't."
  end

  test "should require the number of comments" do
    @issue.comments = nil

    refute @issue.valid?, "Issue should require the number of comments, but it didn't."
  end
end

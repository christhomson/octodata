require 'test_helper'

class PullRequestTest < ActiveSupport::TestCase
  setup do
    @pull_request = pull_requests(:rails)
  end

  test "should be valid" do
    assert @pull_request.valid?
  end

  test "should have a number" do
    @pull_request.number = nil

    refute @pull_request.valid?, "PullRequest should require a number, but it didn't."
  end

  test "should require a unique number" do
    refute @pull_request.dup.valid?, "PullRequest should require a unique number, but it didn't."
  end

  test "should only require a unique number scoped to the repository" do
    pr = @pull_request.dup
    pr.repository = repositories(:angular)

    assert pr.valid?, "PullRequest should be valid since the number is unique scoped to the repository."
  end

  test "should require a state" do
    @pull_request.state = nil

    refute @pull_request.valid?, "PullRequest should require a state, but it didn't."
  end

  test "should require a title" do
    @pull_request.title = nil

    refute @pull_request.valid?, "PullRequest should require a title, but it didn't."
  end

  test "should not require a body" do
    @pull_request.body = nil

    assert @pull_request.valid?, "PullRequest should not require a body, but it did."
  end

  test "should require a remote_created_at date" do
    @pull_request.remote_created_at = nil

    refute @pull_request.valid?, "PullRequest should require a remote_created_at date, but it didn't."
  end

  test "should not require a closed_at date" do
    @pull_request.closed_at = nil

    assert @pull_request.valid?, "PullRequest should not require a closed_at date, but it did."
  end

  test "should not require a merged_at date" do
    @pull_request.merged_at = nil

    assert @pull_request.valid?, "PullRequest should not require a merged_at date, but it did."
  end

  test "should require a head sha" do
    @pull_request.head_sha = nil

    refute @pull_request.valid?, "PullRequest should require a HEAD sha, but it didn't."
  end

  test "should require a head ref" do
    @pull_request.head_ref = nil

    refute @pull_request.valid?, "PullRequest should require a HEAD ref, but it didn't."
  end

  test "should require a base sha" do
    @pull_request.base_sha = nil

    refute @pull_request.valid?, "PullRequest should require a base sha, but it didn't."
  end

  test "should require a base ref" do
    @pull_request.base_ref = nil

    refute @pull_request.valid?, "PullRequest should require a base ref, but it didn't."
  end

  test "should require a repository" do
    @pull_request.repository = nil

    refute @pull_request.valid?, "PullRequest should require a repository, but it didn't."
  end

  test "should not require a merge_commit_sha" do
    @pull_request.merge_commit_sha = nil

    assert @pull_request.valid?, "PullRequest should not require a merge commit sha, but it did."
  end

  test "should require a mergeable state string" do
    @pull_request.mergeable_state = nil

    refute @pull_request.valid?, "PullRequest should require a mergeable state, but it didn't."
  end

  test "should not require a merged_by username" do
    @pull_request.merged_by = nil

    assert @pull_request.valid?, "PullRequest should not require a merged_by username, but it did."
  end

  test "should require the number of comments" do
    @pull_request.comments = nil

    refute @pull_request.valid?, "PullRequest should require the number of comments, but it didn't."
  end

  test "should require the number of commits" do
    @pull_request.commits = nil

    refute @pull_request.valid?, "PullRequest should require the number of commits, but it didn't."
  end

  test "should require the number of additions" do
    @pull_request.additions = nil

    refute @pull_request.valid?, "PullRequest should require the number of commits, but it didn't."
  end

  test "should require the number of deletions" do
    @pull_request.deletions = nil

    refute @pull_request.valid?, "PullRequest should require the number of deletions, but it didn't."
  end

  test "should require the number of changed files" do
    @pull_request.changed_files = nil

    refute @pull_request.valid?, "PullRequest should require the number of changed files, but it didn't."
  end
end

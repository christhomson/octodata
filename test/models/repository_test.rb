require 'test_helper'

class RepositoryTest < ActiveSupport::TestCase
  setup do
    @repo = repositories(:rails)
  end

  test "should require a name" do
    @repo.name = nil

    refute @repo.valid?, "Repo should require a name, but it didn't."
  end

  test "should require an owner" do
    @repo.owner = nil

    refute @repo.valid?, "Repo should require an owner, but it didn't."
  end

  test "should require a remote_id" do
    @repo.remote_id = nil

    refute @repo.valid?, "Repo should require a remote_id, but it didn't."
  end

  test "should have a numeric remote_id" do
    @repo.remote_id = 'doge'

    refute @repo.valid?, "Repo should require a numeric remote_id, but it didn't."
  end

  test "should enforce a unique owner + name" do
    new_repo = @repo.dup

    refute new_repo.valid?, "Repo should have a unique owner + name combination, but it didn't."
  end

  test "users should produce a unique list of users" do
    assert_operator @repo.users.size, :>, 0
    assert_equal @repo.users, @repo.users.uniq
  end

  test "#github_url should return a GitHub URL" do
    assert_match /^https?:\/\/(www\.)?github.com\/(.+)/, @repo.github_url
  end
end

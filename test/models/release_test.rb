require 'test_helper'

class ReleaseTest < ActiveSupport::TestCase
  setup do
    @release = releases(:rails)
  end

  test "should be valid" do
    assert @release.valid?
  end

  test "should require a url" do
    @release.url = nil

    refute @release.valid?, "Release should require a url, but it didn't."
  end

  test "should require a remote_id" do
    @release.remote_id = nil

    refute @release.valid?, "Release should require a remote_id, but it didn't."
  end

  test "should require a tag name" do
    @release.tag_name = nil

    refute @release.valid?, "Release should require a tag name, but it didn't."
  end

  test "should require a target commitish" do
    @release.target_commitish = nil

    refute @release.valid?, "Release should require a target commitish, but it didn't."
  end

  test "should not require a name" do
    @release.name = nil

    assert @release.valid?, "Release should not require a name, but it did."
  end

  test "should not require a body" do
    @release.body = nil

    assert @release.valid?, "Release should not require a body, but it did."
  end

  test "should require an author" do
    @release.author = nil

    refute @release.valid?, "Release should require an author, but it didn't."
  end

  test "should require a repository" do
    @release.repository = nil

    refute @release.valid?, "Release should require a repository, but it didn't."
  end
end

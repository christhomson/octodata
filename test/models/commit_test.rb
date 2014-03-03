require 'test_helper'

class CommitTest < ActiveSupport::TestCase
  setup do
    @commit = commits(:rails)
  end

  test "should be valid" do
    assert @commit.valid?
  end

  test "should require a sha" do
    @commit.sha = nil

    refute @commit.valid?, "Commit should require a sha, but it didn't."
  end

  test "should require a message" do
    @commit.message = nil

    refute @commit.valid?, "Commit should require a message, but it didn't."
  end

  test "should require an author's name" do
    @commit.author_name = nil

    refute @commit.valid?, "Commit should require an author's name, but it didn't."
  end

  test "should require an author's email" do
    @commit.author_email = nil

    refute @commit.valid?, "Commit should require an author's email, but it didn't."
  end

  test "should require a url" do
    @commit.url = nil

    refute @commit.valid?, "Commit should require a URL, but it didn't."
  end
end

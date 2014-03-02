require 'test_helper'

class DownloadTest < ActiveSupport::TestCase
  setup do
    @download = downloads(:jpg)
  end

  test "should require a url" do
    @download.url = nil

    refute @download.valid?, "Download should require a url, but it didn't."
  end

  test "should require an HTML url" do
    @download.html_url = nil

    refute @download.valid?, "Download should require an HTML url, but it didn't."
  end

  test "should require a remote_id" do
    @download.remote_id = nil

    refute @download.valid?, "Download should require a remote_id, but it didn't."
  end

  test "should require the remote_id to be unique for this repository" do
    refute @download.dup.valid?, "Download should require a unique remote_id, but it didn't."
  end

  test "should not require a unique remote_id globally" do
    download = @download.dup
    download.repository = repositories(:angular)

    assert download.valid?, "Download should not require a unique remote_id (but it did) since these are two different repositories."
  end

  test "should require a name" do
    @download.name = nil

    refute @download.valid?, "Download should require a name, but it didn't."
  end

  test "should not require a description" do
    @download.description = nil

    assert @download.valid?, "Download should not require a description, but it did."
  end

  test "should require a size" do
    @download.size = nil

    refute @download.valid?, "Download should require a size, but it didn't."
  end

  test "should require a download count" do
    @download.download_count = nil

    refute @download.valid?, "Download should require a download count, but it didn't."
  end

  test "should require a content type" do
    @download.content_type = nil

    refute @download.valid?, "Download should require a content type, but it didn't."
  end
end

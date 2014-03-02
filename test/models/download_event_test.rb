require 'test_helper'

class DownloadEventTest < ActiveSupport::TestCase
  setup do
    @event = events(:download)
  end

  test "should require a download" do
    @event.download = nil

    refute @event.valid?, "DownloadEvent should require a download, but it didn't."
  end

  test "should have an action description" do
    assert @event.action_description.present?, "DownloadEvent should have an action description, but it didn't."
  end
end

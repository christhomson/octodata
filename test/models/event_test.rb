require 'test_helper'

class EventTest < ActiveSupport::TestCase
  setup do
    @event = events(:joe_push)
  end

  test "requires an event_type" do
    @event.event_type = nil

    refute @event.valid?, "Event should require a type, but it didn't."
  end

  test "requires a repository" do
    @event.repository = nil

    refute @event.valid?, "Event should require a repository, but it didn't."
  end

  test "requires a remote_id" do
    @event.remote_id = nil

    refute @event.valid?, "Event should require a remote_id, but it didn't."
  end

  test "requires a user" do
    @event.user = nil

    refute @event.valid?, "Event should require a user, but it didn't."
  end
end

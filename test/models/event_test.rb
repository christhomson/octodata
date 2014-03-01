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

  test "requires an import" do
    @event.import = nil

    refute @event.valid?, "Event should require an import, but it didn't."
  end

  test "requires an occurred_at date" do
    @event.occurred_at = nil

    refute @event.valid?, "Event should require an occurred_at date, but it didn't."
  end

  test "requires raw data" do
    @event.raw_data = nil

    refute @event.valid?, "Event should require raw data, but it didn't."
  end

  test "requires a unique remote_id" do
    e = events(:joe_watch)
    e.remote_id = @event.remote_id

    refute @event.valid?, "Event should require a unique remote_id, but it didn't."
  end
end

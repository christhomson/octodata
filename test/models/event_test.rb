require 'test_helper'

class EventTest < ActiveSupport::TestCase
  setup do
    @event = events(:push)
  end

  test "requires a type" do
    @event.type = nil

    refute @event.valid?, "Event should require a type, but it didn't."
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

  test "requires a unique remote_id scoped to the type" do
    refute @event.dup.valid?, "Event should require a unique remote_id, but it didn't."
  end
end

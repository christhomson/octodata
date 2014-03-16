require 'test_helper'

class PushEventTest < ActiveSupport::TestCase
  setup do
    @event = events(:push)
  end

  test "should be valid" do
    assert @event.valid?
  end

  test "should require a head" do
    @event.head = nil

    refute @event.valid?, "PushEvent should require a head, but it didn't."
  end

  test "should require a ref" do
    @event.ref = nil

    refute @event.valid?, "PushEvent should require a ref, but it didn't."
  end

  test "should require a size" do
    @event.size = nil

    refute @event.valid?, "PushEvent should require a size, but it didn't."
  end
end

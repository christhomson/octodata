require 'test_helper'

class ForkEventTest < ActiveSupport::TestCase
  setup do
    @event = events(:fork)
  end

  test "should be valid" do
    assert @event.valid?
  end

  test "should require a repository" do
    @event.repository = nil

    refute @event.valid?, "ForkEvent should require a repository, but it didn't."
  end
end

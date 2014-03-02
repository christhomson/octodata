require 'test_helper'

class ForkEventTest < ActiveSupport::TestCase
  setup do
    @event = events(:fork)
  end

  test "should require a repository" do
    @event.repository = nil

    refute @event.valid?, "ForkEvent should require a repository, but it didn't."
  end

  test "should have a description" do
    assert @event.description.present?, "ForkEvent should have a description."
  end
end

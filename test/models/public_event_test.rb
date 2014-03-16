require 'test_helper'

class PublicEventTest < ActiveSupport::TestCase
  setup do
    @event = events(:public)
  end

  test "should be valid" do
    assert @event.valid?
  end
end

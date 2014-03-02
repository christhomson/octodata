require 'test_helper'

class PublicEventTest < ActiveSupport::TestCase
  setup do
    @event = events(:public)
  end

  test "should be valid" do
    assert @event.valid?
  end

  test "should have an action description" do
    assert @event.action_description.present?, "PublicEvent should have an action description, but it didn't."
  end
end

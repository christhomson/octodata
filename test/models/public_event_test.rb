require 'test_helper'

class PublicEventTest < ActiveSupport::TestCase
  setup do
    @event = events(:public)
  end

  test "should have an action description" do
    assert @event.action_description.present?, "PublicEvent should have an action description, but it didn't."
  end
end

require 'test_helper'

class DeleteEventTest < ActiveSupport::TestCase
  setup do
    @event = events(:delete)
  end

  test "should require a repository" do
    @event.repository = nil

    refute @event.valid?, "DeleteEvent should require a repository, but it didn't."
  end

  test "should require a ref_type" do
    @event.ref_type = nil

    refute @event.valid?, "DeleteEvent should require a ref_type, but it didn't."
  end

  test "should require a ref_type that is branch or tag" do
    ['branch', 'tag'].each do |type|
      @event.ref_type = type
      assert @event.valid?, "#{type} should be a valid ref_type, but it isn't."
    end

    @event.ref_type = "repository"
    refute @event.valid?, "repository should not be a valid ref_type."
  end

  test "should require a ref" do
    @event.ref = nil

    refute @event.valid?, "DeleteEvent should require a ref, but it didn't."
  end

  test "should have an action description" do
    assert @event.action_description.present?, "CreateEvent should have an action description."
  end
end

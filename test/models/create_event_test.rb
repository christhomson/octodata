require 'test_helper'

class CreateEventTest < ActiveSupport::TestCase
  setup do
    @event = events(:create)
  end

  test "should be valid" do
    assert @event.valid?
  end

  test "should require a repository" do
    @event.repository = nil

    refute @event.valid?, "CreateEvent should require a repository, but it didn't."
  end

  test "should require a ref_type" do
    @event.ref_type = nil

    refute @event.valid?, "CreateEvent should require a ref_type, but it didn't."
  end

  test "should require a ref_type that is branch, tag, or repository" do
    ['branch', 'repository', 'tag'].each do |type|
      @event.ref_type = type
      assert @event.valid?, "#{type} should be a valid ref_type, but it isn't."
    end

    @event.ref_type = "something-else"
    refute @event.valid?, "something-else should not be a valid ref_type."
  end

  test "should require a ref unless a repo was created" do
    @event.ref_type = 'repository'
    @event.ref = nil
    assert @event.valid?, "CreateEvent should not require a ref when ref_type=repository, but id did."

    ['branch', 'tag'].each do |type|
      @event.ref_type = type
      @event.ref = nil

      refute @event.valid?, "CreateEvent should require a ref for ref_type=#{type}, but it didn't."
    end
  end

  test "should require a master_branch" do
    @event.master_branch = nil

    refute @event.valid?, "CreateEvent should require a master_branch, but it didn't."
  end
end

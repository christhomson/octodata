require 'test_helper'

class DeploymentStatusEventTest < ActiveSupport::TestCase
  setup do
    @event = events(:deployment_status)
  end

  test "should be valid" do
    assert @event.valid?
  end

  test "should require a repository" do
    @event.repository = nil

    refute @event.valid?, "DeploymentStatusEvent should require a repository, but it didn't."
  end

  test "should require a sha" do
    @event.sha = nil

    refute @event.valid?, "DeploymentStatusEvent should require a sha, but it didn't."
  end

  test "should require a state" do
    @event.state = nil

    refute @event.valid?, "DeploymentStatusEvent should require a state, but it didn't."
  end

  test "should require a valid state" do
    %w{pending success failure error}.each do |state|
      @event.state = state
      assert @event.valid?, "DeploymentStatusEvent should be valid with a #{state} state, but it isn't."
    end

    @event.state = 'unknown'
    refute @event.valid?, "DeploymentStatusEvent should not be valid with state=unknown, but it is."
  end

  test "should have an action description" do
    assert @event.action_description.present?, "DeploymentStatusEvent should have an action description."
  end
end

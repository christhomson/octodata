require 'test_helper'

class DeploymentEventTest < ActiveSupport::TestCase
  setup do
    @event = events(:deployment)
  end

  test "should require a repository" do
    @event.repository = nil

    refute @event.valid?, "DeploymentEvent should require a repository, but it didn't."
  end

  test "should require a sha" do
    @event.sha = nil

    refute @event.valid?, "DeploymentEvent should require a sha, but it didn't."
  end

  test "should have an action description" do
    assert @event.action_description.present?, "DeploymentEvent should have an action description."
  end
end

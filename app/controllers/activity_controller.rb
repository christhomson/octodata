class ActivityController < ApplicationController
  def index
    @events = current_user.events.includes(associations_to_include).recent
  end

  private
  def associations_to_include
    [:comment, :issue, :pull_request, :release, :repository, :user]
  end
end

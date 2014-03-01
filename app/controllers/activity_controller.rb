class ActivityController < ApplicationController
  def index
    @events = current_user.events.recent
  end
end

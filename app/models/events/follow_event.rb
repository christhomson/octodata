class FollowEvent < Event
  validates :target_user, presence: true

  def github_event=(github_event)
    target_user = github_event.payload.target.login
  end

  def action_description
    "followed #{target_user}"
  end
end

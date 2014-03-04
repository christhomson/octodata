class WatchEvent < Event
  validates :repository, presence: true
  validates :action, presence: true

  def github_event=(github_event)
    self.action = github_event.payload.action
  end

  def action_description
    "watched #{repository.display_name}"
  end
end

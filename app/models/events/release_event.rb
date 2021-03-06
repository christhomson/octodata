class ReleaseEvent < Event
  validates :repository, presence: true
  validates :action, presence: true
  validates :release, presence: true

  def github_event=(github_event)
    self.action = github_event.payload.action
    build_release.assign_filtered_attributes(github_event)
    release.repository = repository
  end
end

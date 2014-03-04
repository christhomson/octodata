class ReleaseEvent < Event
  belongs_to :release
  validates :repository, presence: true
  validates :action, presence: true
  validates :release, presence: true

  def github_event=(github_event)
    self.action = github_event.payload.action
    build_release.assign_filtered_attributes(github_event)
    release.repository = repository
  end

  def action_description
    "#{action} the release #{release.name} on #{repository.display_name}"
  end
end

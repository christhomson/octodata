class PullRequestEvent < Event
  belongs_to :pull_request
  validates :action, presence: true, inclusion: { in: %w{opened closed synchronize reopened}}

  def github_event=(github_event)
    self.action = github_event.payload.action
    self.pull_request = PullRequest.find_or_initialize_by(repository: repository, number: github_event.payload.pull_request.number)
    self.pull_request.assign_filtered_attributes(github_event).save!
  end

  def action_description
    "#{user.username} #{action} pull request ##{pull_request.number} (#{pull_request.title}) on #{repository.display_name}"
  end
end

class PullRequestEvent < Event
  belongs_to :pull_request
  validates :action, presence: true, inclusion: { in: %w{opened closed synchronize reopened}}
  validates :pull_request, presence: true
  validates :repository, presence: true

  def github_event=(github_event)
    self.action = github_event.payload.action
    self.pull_request = PullRequest.find_or_initialize_by(repository: repository, number: github_event.payload.pull_request.number)
    self.pull_request.assign_filtered_attributes(github_event)
  end
end

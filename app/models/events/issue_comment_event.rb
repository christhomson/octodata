class IssueCommentEvent < Event
  validates :repository, presence: true
  validates :action, presence: true
  validates :comment, presence: true
  validates :issue, presence: true

  def github_event=(github_event)
    self.action = github_event.payload.action
    self.issue = Issue.find_or_initialize_by(repository: repository, number: github_event.payload.issue.number)
    self.issue.assign_filtered_attributes(github_event)

    self.build_comment.assign_filtered_attributes(github_event)
  end
end

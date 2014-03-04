class IssueCommentEvent < Event
  belongs_to :comment
  belongs_to :issue

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

  def action_description
    "commented on issue ##{issue.number} (#{issue.title}) on #{repository.display_name}"
  end
end

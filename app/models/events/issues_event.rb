class IssuesEvent < Event
  belongs_to :issue

  validates :issue, presence: true
  validates :action, presence: true
  validates :repository, presence: true

  def github_event=(github_event)
    self.action = github_event.payload.action
    self.issue = Issue.find_or_initialize_by(repository: repository, number: github_event.payload.issue.number)
    self.issue.assign_filtered_attributes(github_event)
    self.issue.save!
  end

  def action_description
    "#{user.username} #{action} issue ##{issue.number} on #{repository.display_name}"
  end
end

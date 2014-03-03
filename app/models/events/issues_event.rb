class IssuesEvent < Event
  belongs_to :issue

  validates :issue, presence: true
  validates :action, presence: true
  validates :repository, presence: true

  def github_event=(github_event)
    self.action = github_event.payload.action
    self.build_issue(issue_attributes(github_event)).save!
  end

  def action_description
    "#{user.username} #{action} issue ##{issue.number} on #{repository.display_name}"
  end

  private
  def issue_attributes(github_event)
    # TODO - duplication - move this into the Issue model.
    github_event.payload.issue.to_hash.with_indifferent_access.tap do |issue|
      issue[:remote_id] = issue[:id]
      issue[:remote_created_at] = issue[:created_at]
      issue[:url] = issue[:html_url]
      issue[:creator] = issue[:user][:login]
      issue[:pull_request] = !!issue[:pull_request]
      issue[:repository_id] = self.repository.id

      attrs_to_keep = %w{
        url remote_id number title creator state assignee milestone
        comments remote_created_at closed_at pull_request body repository_id 
      }
      issue.send(:slice!, *attrs_to_keep)
    end
  end
end

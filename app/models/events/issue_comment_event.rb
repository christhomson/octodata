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
    self.issue.assign_attributes(issue_attributes(github_event))
    self.issue.save!

    self.build_comment(comment_attributes(github_event)).save!
  end

  def action_description
    "#{user.username} commented on issue ##{issue.number} (#{issue.title}) on #{repository.display_name}"
  end

  private
  def issue_attributes(github_event)
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

  def comment_attributes(github_event)
    github_event.payload.comment.to_hash.with_indifferent_access.tap do |comment|
      comment[:remote_id] = github_event.payload.comment.id

      attrs_to_keep = %w{html_url url remote_id body path position line commit_id}
      comment.slice! *attrs_to_keep
    end
  end
end

class PullRequestEvent < Event
  belongs_to :pull_request
  validates :action, presence: true, inclusion: { in: %w{opened closed synchronize reopened}}

  def github_event=(github_event)
    self.action = github_event.payload.action
    self.pull_request = PullRequest.find_or_initialize_by(repository: repository, number: github_event.payload.pull_request.number)
    self.pull_request.assign_attributes(pull_request_attributes(github_event))
    self.pull_request.save!
  end

  def action_description
    "#{user.username} #{action} pull request ##{pull_request.number} (#{pull_request.title}) on #{repository.display_name}"
  end

  private
  def pull_request_attributes(github_event)
    github_event.payload.pull_request.to_hash.with_indifferent_access.tap do |pull_request|
      pull_request[:remote_id] = pull_request[:id]
      pull_request[:remote_created_at] = pull_request[:created_at]
      pull_request[:head_sha] = pull_request[:head][:sha]
      pull_request[:head_ref] = pull_request[:head][:ref]
      pull_request[:base_sha] = pull_request[:base][:sha]
      pull_request[:base_ref] = pull_request[:base][:sha]
      pull_request[:merged_by] = pull_request[:merged_by][:login] if pull_request[:merged_by]
      pull_request[:url] = pull_request[:html_url]

      attrs_to_delete = [
        'head', 'base', '_links', 'user', 'html_url', 'diff_url',
        'patch_url', 'issue_url', 'commits_url', 'review_comments_url',
        'review_comment_url', 'comments_url', 'statuses_url', 'created_at',
        'updated_at', 'repo', 'review_comments', 'id'
      ]
      pull_request.send(:except!, *attrs_to_delete)
    end
  end
end

class PullRequestReviewCommentEvent < Event
  belongs_to :comment
  validates :comment, presence: true

  def github_event=(github_event)
    self.build_comment(comment_attributes(github_event)).save
  end

  def action_description
    "#{user.username} commented on a pull request"
  end

  private
  def comment_attributes(github_event)
    github_event.payload.comment.to_hash.with_indifferent_access.tap do |comment|
      comment[:remote_id] = github_event.payload.comment.id

      attrs_to_keep = %w{html_url url remote_id body path position line commit_id}
      comment.slice! *attrs_to_keep
    end
  end
end

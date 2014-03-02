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
  def comment_attributes
    github_event.payload.comment.to_hash.tap do |comment|
      comment.delete('user')
      comment.delete('id')
      comment[:remote_id] = github_event.payload.comment.id
    end
  end
end

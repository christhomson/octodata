class PullRequestReviewCommentEvent < Event
  belongs_to :comment
  validates :comment, presence: true

  def github_event=(github_event)
    self.build_comment.assign_filtered_attributes(github_event).save!
  end

  def action_description
    "#{user.username} commented on a pull request"
  end
end

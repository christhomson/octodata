class PullRequestReviewCommentEvent < Event
  validates :comment, presence: true

  def github_event=(github_event)
    self.build_comment.assign_filtered_attributes(github_event)
  end
end

class PullRequestReviewCommentEvent < Event
  belongs_to :comment
  validates :comment, presence: true

  def github_event=(github_event)
    self.build_comment.assign_filtered_attributes(github_event)
  end

  def action_description
    "commented on a pull request on #{repository.display_name}"
  end
end

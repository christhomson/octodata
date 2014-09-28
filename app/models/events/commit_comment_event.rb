class CommitCommentEvent < Event
   validates :comment, presence: true

  def github_event=(github_event)
    build_comment.assign_filtered_attributes(github_event)
  end
end

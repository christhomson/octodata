class CommitCommentEvent < Event
   belongs_to :comment
   validates :comment, presence: true

  def github_event=(github_event)
    build_comment.assign_filtered_attributes(github_event)
  end
end

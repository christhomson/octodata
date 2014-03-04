class CommitCommentEvent < Event
   belongs_to :comment
   validates :comment, presence: true

  def action_description
    "commented on a commit (#{short_sha(comment.commit_id)}) in #{repository.display_name}"
  end

  def github_event=(github_event)
    build_comment.assign_filtered_attributes(github_event)
  end
end

class CommitCommentEvent < Event
   belongs_to :comment
   validates :comment, presence: true

  def action_description
    "#{user.username} commented on a commit (#{comment.commit_id}) in #{repository.display_name}"
  end

  def github_event=(github_event)
    build_comment.assign_filtered_attributes(github_event).save!
  end
end

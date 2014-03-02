class CommitCommentEvent < Event
   belongs_to :comment
   validates :comment, presence: true

  def description
    "#{user.username} commented on a commit (#{comment.commit_id}) in #{repository.display_name}"
  end

  def github_event=(github_event)
    self.build_comment(comment_attributes(github_event)).save
  end

  private
  def comment_attributes(github_event)
    github_event.payload.comment.to_hash.tap do |comment|
      comment.delete('user')
      comment[:remote_id] = github_event.payload.comment.id
    end
  end
end

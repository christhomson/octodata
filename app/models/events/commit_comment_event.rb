class CommitCommentEvent < Event
  belongs_to :comment

  def github_event=(github_event)
    self.build_comment(github_event[:payload][:comment].merge(remote_id: github_event[:id]))
  end
end

class PushEvent < Event
  has_many :commits, as: :event, foreign_key: :event_id

  validates :head, presence: true
  validates :ref, presence: true
  validates :size, presence: true, numericality: { only_integer: true }

  def github_event=(github_event)
    [:head, :ref, :size].each do |attr|
      self[attr] = github_event[:payload][attr]
    end

    github_event.payload.commits.each do |commit|
      commit = commit.to_hash.merge!({
        author_name: commit[:author][:name],
        author_email: commit[:author][:email]
      })

      commit.delete 'author'
      commits.build(commit)
    end
  end

  def action_description
    "#{user.username} pushed #{size} commits to #{repository.display_name}"
  end
end

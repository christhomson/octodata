class PushEvent < Event
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

  def branch
    matches = ref.match(/refs\/heads\/(.+)/)
    matches[1] if matches && matches.size > 1
  end
end

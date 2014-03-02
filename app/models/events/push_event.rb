class PushEvent < Event
  validates :head, presence: true
  validates :ref, presence: true
  validates :size, presence: true, numericality: { only_integer: true }

  def github_event=(github_event)
    [:head, :ref, :size].each do |attr|
      self[attr] = github_event[:payload][attr]
    end

    self.repository = Repository.find_or_initialize_by(remote_id: github_event[:repo][:id]).tap do |repo|
      repo.attributes.merge!({
        name: github_event[:repo][:name].split('/').last,
        owner: github_event[:repo][:name].split('/').first
      })
    end
  end

  def description
    "#{user.username} pushed #{size} to #{repository.display_name}"
  end
end

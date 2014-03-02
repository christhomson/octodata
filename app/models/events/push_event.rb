class PushEvent < Event
  validates :head, presence: true
  validates :ref, presence: true
  validates :size, presence: true, numericality: { only_integer: true }

  def github_event=(event_hash)
    [:head, :ref, :size].each do |attr|
      self[attr] = event_hash[:payload][attr]
    end

    self.repository = Repository.find_or_initialize_by(remote_id: event_hash[:repo][:id]).tap do |repo|
      repo.attributes.merge!({
        name: event_hash[:repo][:name].split('/').last,
        owner: event_hash[:repo][:name].split('/').first
      })
    end
  end

  def description
    "#{user.username} pushed #{size} to #{repository.display_name}"
  end
end

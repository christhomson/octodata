class PushEvent < Event
  validates :head, presence: true
  validates :ref, presence: true
  validates :size, presence: true, numericality: { only_integer: true }

  def github_event=(github_event)
    [:head, :ref, :size].each do |attr|
      self[attr] = github_event[:payload][attr]
    end
  end

  def action_description
    "#{user.username} pushed #{size} to #{repository.display_name}"
  end
end

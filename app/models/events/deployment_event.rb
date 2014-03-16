class DeploymentEvent < Event
  validates :repository, presence: true
  validates :sha, presence: true

  def github_event=(github_event)
    [:sha, :payload, :description].each do |attr|
      self[attr] = github_event.payload[attr]
    end
  end
end

class DeploymentStatusEvent < Event
  validates :repository, presence: true
  validates :sha, presence: true
  validates :state, presence: true, inclusion: { in: %w{pending success failure error} }

  def github_event=(github_event)
    [:sha, :state, :payload, :target_url, :description].each do |attr|
      self[attr] = github_event.payload[attr]
    end
  end
end

class DeploymentStatusEvent < Event
  validates :repository, presence: true
  validates :sha, presence: true
  validates :state, presence: true, inclusion: { in: %w{pending success failure error} }

  def github_event=(github_event)
    [:sha, :state, :payload, :target_url, :description].each do |attr|
      self[attr] = github_event.payload[attr]
    end
  end

  def action_description
    "Status of deployment of #{short_sha(sha)} in #{repository.display_name} changed to #{state}."
  end
end

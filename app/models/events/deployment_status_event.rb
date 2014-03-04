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
    "changed the status of the #{short_sha(sha)} deployment in #{repository.display_name} to #{state}."
  end
end

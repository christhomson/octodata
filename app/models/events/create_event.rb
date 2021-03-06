class CreateEvent < Event
  validates :repository, presence: true
  validates :ref_type, presence: true, inclusion: { in: %w{branch repository tag} }
  validates :ref, presence: true, unless: -> { ref_type == 'repository' }
  validates :master_branch, presence: true

  def github_event=(github_event)
    [:ref_type, :ref, :master_branch, :description].each do |attr|
      self[attr] = github_event.payload[attr]
    end
  end
end

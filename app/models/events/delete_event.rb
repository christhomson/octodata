class DeleteEvent < Event
  validates :repository, presence: true
  validates :ref_type, presence: true, inclusion: { in: %w{branch tag} }
  validates :ref, presence: true

  def github_event=(github_event)
    [:ref_type, :ref].each do |attr|
      self[attr] = github_event.payload[attr]
    end
  end
end

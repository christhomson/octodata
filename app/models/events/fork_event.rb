class ForkEvent < Event
  validates :repository, presence: true

  def github_event=(github_event)
  end
end

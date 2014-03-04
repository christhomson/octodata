class ForkEvent < Event
  validates :repository, presence: true

  def github_event=(github_event)
  end

  def action_description
    "forked #{repository.display_name}"
  end
end

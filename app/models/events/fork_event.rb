class ForkEvent < Event
  validates :repository, presence: true

  def github_event=(github_event)
  end

  def description
    "#{user.username} forked #{repository.display_name}"
  end
end

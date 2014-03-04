class PublicEvent < Event
  def github_event=(github_event)
  end

  def action_description
    "open-sourced #{repository.display_name}"
  end
end

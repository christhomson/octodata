class PushEvent < Event
  def github_event=(event_hash)
    [:head, :ref, :size].each do |attr|
      self[attr] = event_hash[attr]
    end
  end

  def description
    "#{user.username} pushed #{distinct_size} to #{repository.display_name}"
  end
end

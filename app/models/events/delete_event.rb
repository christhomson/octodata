class DeleteEvent < Event
  validates :repository, presence: true
  validates :ref_type, presence: true, inclusion: { in: %w{branch tag} }
  validates :ref, presence: true

  def github_client=(github_client)
    [:ref_type, :ref].each do |attr|
      self[attr] = github_client.payload[attr]
    end
  end

  def action_description
    "#{user.username} deleted the #{ref_type} #{ref} from #{repository.display_name}"
  end
end
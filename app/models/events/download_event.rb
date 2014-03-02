class DownloadEvent < Event
  belongs_to :download
  validates :download, presence: true

  def github_event=(github_event)
    self.build_download(download_attributes(github_event)).save
  end

  def action_description
    "#{user.username} created the #{download.name} download on #{repository.display_name}"
  end

  private
  def download_attributes(github_event)
    github_event.payload.download.to_hash.tap do |download|
      download.delete('id')
      download[:remote_id] = github_payload.download.id
    end
  end
end

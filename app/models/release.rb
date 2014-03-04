class Release < ActiveRecord::Base
  belongs_to :repository

  validates :url, presence: true
  validates :remote_id, presence: true, numericality: { only_integer: true }
  validates :tag_name, presence: true
  validates :target_commitish, presence: true
  validates :remote_created_at, presence: true
  validates :published_at, presence: true
  validates :author, presence: true
  validates :repository, presence: true

  def assign_filtered_attributes(github_event)
    release = github_event.payload.release.to_hash.with_indifferent_access
    release[:remote_id] = release[:id]
    release[:remote_created_at] = release[:created_at]
    release[:author] = release[:author][:login]
    release[:url] = release[:html_url]

    attrs_to_keep = %w{
      remote_id url tag_name target_commitish name body draft prerelease
      remote_created_at published_at author
    }

    release.slice! *attrs_to_keep
    assign_attributes(release)

    self
  end
end

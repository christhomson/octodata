class Event < ActiveRecord::Base
  include ActionView::Helpers::TextHelper

  EXCLUDED_TYPES = %w{
    DownloadEvent ForkApplyEvent GistEvent
    GollumEvent StatusEvent TeamAddEvent
  }

  belongs_to :user
  belongs_to :import
  belongs_to :repository

  validates :type,          presence: true
  validates :remote_id,     presence: true, uniqueness: { scope: :type }
  validates :user_id,       presence: true
  validates :import_id,     presence: true
  validates :raw_data,      presence: true
  validates :occurred_at,   presence: true

  scope :recent, -> { reorder('occurred_at desc') }

  def self.from_github(github_event, user, import)
    unless EXCLUDED_TYPES.include? github_event.type
      user.events.build(type: github_event.type).tap do |event|
        owner, repo_name = github_event.repo.name.split('/')
        event.repository = Repository.find_or_initialize_by(remote_id: github_event.repo.id).tap do |repo|
          repo.owner = owner
          repo.name = repo_name
        end

        event.github_event = github_event
        event.assign_attributes({
          import: import,
          remote_id: github_event.id,
          raw_data: YAML::dump(github_event),
          occurred_at: github_event.created_at
        })
      end
    end
  end

  protected
  def short_sha(sha)
    sha[0..7]
  end
end

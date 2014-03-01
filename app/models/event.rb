class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :import
  belongs_to :repository

  validates :event_type,    presence: true
  validates :remote_id,     presence: true, uniqueness: true
  validates :repository_id, presence: true
  validates :user_id,       presence: true
  validates :import_id,     presence: true

  scope :follows,               -> { where event_type: 'FollowEvent' }
  scope :gists,                 -> { where event_type: 'GistEvent' }
  scope :issue_comments,        -> { where event_type: 'IssueCommentEvent' }
  scope :issues,                -> { where event_type: 'IssuesEvent' }
  scope :pull_requests,         -> { where event_type: 'PullRequestEvent' }
  scope :pull_request_comments, -> { where event_type: 'PullRequestReviewEvent' }
  scope :pushes,                -> { where event_type: 'PushEvent' }
  scope :watches,               -> { where event_type: 'WatchEvent' }
  

  def self.from_hash(user, github_hash)
    Event.new(
      remote_id: github_hash.id,
      event_type: github_hash.type,
      distinct_size: github_hash.payload.distinct_size,
      raw_data: YAML::dump(github_hash),
      user: user
    ).tap do |event|
      event.repository = Repository.find_or_create_by(remote_id: github_hash.repo.id) do |repo|
        repo.update_attributes(
          owner: github_hash.repo.name.split('/').first,
          name: github_hash.repo.name.split('/').last
        )
      end
    end
  end
end

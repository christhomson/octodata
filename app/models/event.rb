class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :import
  belongs_to :repository

  validates :event_type, presence: true
  validates :remote_id, presence: true
  validates :repository_id, presence: true

  scope :follows, -> { where type: 'FollowEvent' }
  scope :gists, -> { where type: 'GistEvent' }
  scope :issue_comments, -> { where type: 'IssueCommentEvent' }
  scope :issues, -> { where type: 'IssuesEvent' }
  scope :pull_requests, -> { where type: 'PullRequestEvent' }
  scope :pull_request_comments, -> { where type: 'PullRequestReviewEvent' }
  scope :pushes, -> { where type: 'PushEvent' }
  scope :watches, -> { where type: 'WatchEvent' }
  

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

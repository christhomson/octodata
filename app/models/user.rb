class User < ActiveRecord::Base
  has_many :imports
  has_many :events

  has_many :commit_comment_events
  has_many :create_events
  has_many :delete_events
  has_many :deployment_events
  has_many :deployment_status_events
  has_many :follow_events
  has_many :fork_events
  has_many :gollum_events
  has_many :issue_comment_events
  has_many :issues_events
  has_many :member_events
  has_many :public_events
  has_many :pull_request_events
  has_many :pull_request_review_comment_events
  has_many :push_events
  has_many :release_events
  has_many :status_events
  has_many :team_add_events
  has_many :watch_events

  has_many :repositories, -> { uniq }, through: :events

  has_many :commits, through: :push_events
  has_many :pull_requests, through: :pull_request_events
  has_many :issue_comments, through: :issue_comment_events, source: :comment
  has_many :pull_request_review_comments, through: :pull_request_review_comment_events, source: :comment
  has_many :commit_comments, through: :commit_comment_events, source: :comment

  validates :username, presence: true
  validates :auth_token, presence: true

  def github_client
    @client ||= Github.new oauth_token: auth_token
  end

  def self.from_auth(auth)
    if auth.present?
      where(username: auth[:info][:nickname]).first_or_initialize.tap do |user|
        user.auth_token = auth[:credentials][:token]
        user.save! if user.changed?
      end
    end
  end

  def self.import_all
    User.all.map(&:import!)
  end

  def import!
    import = imports.build
    import.save!
    Rails.logger.info "Started import for #{username}."

    Import::PAGE_LIMIT.times do |page|
      Rails.logger.info "Importing page #{page + 1} for #{username}."
      events = github_client.activity.events.performed(username, page: page + 1)

      events.each do |event|
        e = Event.from_github(event, self, import)
        next unless e.present?
        return unless e.valid?
        e.save!
      end
    end

  ensure
    Rails.logger.info "Finished import for #{username}."
  end
end

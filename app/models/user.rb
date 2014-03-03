class User < ActiveRecord::Base
  has_many :imports
  has_many :events
  has_many :repositories, -> { uniq }, through: :events

  validates :username, presence: true
  validates :auth_token, presence: true

  after_create :queue_import

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
        next if Event::EXCLUDED_TYPES.include? e.type
        return unless e.valid?
        e.save!
      end
    end

  ensure
    Rails.logger.info "Finished import for #{username}."
  end

  private

  def queue_import
    Resque.enqueue(GitHubImportJob, username)
  end
end

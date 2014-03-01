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

  private

  def queue_import
    Resque.enqueue(GitHubImportJob, self)
  end
end

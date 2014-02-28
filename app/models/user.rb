class User < ActiveRecord::Base

  validates :username, presence: true
  validates :auth_token, presence: true

  after_create :queue_import

  def self.from_auth(auth)
    where(username: auth[:info][:nickname]).first_or_initialize.tap do |user|
      user.auth_token = auth[:credentials][:token]
      user.save! if user.changed?
    end
  end

  private

  def queue_import
    Resque.enqueue(GitHubImportJob, self)
  end
end

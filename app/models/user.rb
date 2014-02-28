class User < ActiveRecord::Base

  validates :username, presence: true
  validates :auth_token, presence: true

  def self.from_auth(auth)
    where(username: auth[:info][:nickname]).first_or_initialize.tap do |user|
      user.auth_token = auth[:credentials][:token]
      user.save! if user.changed?
    end
  end
end
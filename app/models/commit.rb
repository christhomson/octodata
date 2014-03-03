class Commit < ActiveRecord::Base
  belongs_to :event

  validates :sha, presence: true
  validates :message, presence: true
  validates :author_name, presence: true
  validates :author_email, presence: true
  validates :url, presence: true
end

class PullRequest < ActiveRecord::Base
  belongs_to :repository

  validates :url, presence: true
  validates :number, presence: true, numericality: { only_integer: true }, uniqueness: { scope: :repository }
  validates :state, presence: true
  validates :title, presence: true
  validates :remote_created_at, presence: true
  validates :head_sha, presence: true
  validates :head_ref, presence: true
  validates :base_sha, presence: true
  validates :base_ref, presence: true
  validates :repository, presence: true
  validates :mergeable_state, presence: true
  validates :comments, presence: true, numericality: { only_integer: true }
  validates :commits, presence: true, numericality: { only_integer: true }
  validates :additions, presence: true, numericality: { only_integer: true }
  validates :deletions, presence: true, numericality: { only_integer: true }
  validates :changed_files, presence: true, numericality: { only_integer: true }
end

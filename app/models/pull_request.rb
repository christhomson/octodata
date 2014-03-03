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

  def assign_filtered_attributes(github_event)
    pull_request = github_event.payload.pull_request.to_hash.with_indifferent_access
    pull_request.merge!({
      remote_id: pull_request[:id],
      remote_created_at: pull_request[:created_at],
      head_sha: pull_request[:head][:sha],
      head_ref: pull_request[:head][:ref],
      base_sha: pull_request[:base][:sha],
      base_ref: pull_request[:base][:ref],
      url: pull_request[:html_url]
    })

    pull_request[:merged_by] = pull_request[:merged_by][:login] if pull_request[:merged_by]

    attrs_to_keep = %w{
      url number state title body remote_created_at closed_at merged_at head_sha head_ref
      base_sha base_ref merge_commit_sha merged mergeable merged_by comments commits
      additions deletions changed_files repository_id milestone assignee mergeable_state
      remote_id
    }

    pull_request.slice! *attrs_to_keep
    assign_attributes(pull_request)

    self
  end
end

class Issue < ActiveRecord::Base
  belongs_to :repository

  validates :url, presence: true
  validates :remote_id, presence: true, numericality: { only_integer: true }
  validates :number, presence: true, numericality: { only_integer: true }, uniqueness: { scope: :repository }
  validates :title, presence: true
  validates :creator, presence: true
  validates :state, presence: true
  validates :remote_created_at, presence: true
  validates :comments, presence: true, numericality: { only_integer: true }
  validates :repository, presence: true

  def assign_filtered_attributes(github_event)
    issue = github_event.payload.issue.to_hash.with_indifferent_access
    issue.merge!({
      remote_id: issue[:id],
      remote_created_at: issue[:created_at],
      url: issue[:html_url],
      creator: issue[:user][:login],
      pull_request: !!issue[:pull_request],
      repository_id: self.repository.id
    })

    attrs_to_keep = %w{
      url remote_id number title creator state assignee milestone
      comments remote_created_at closed_at pull_request body repository_id 
    }
    issue.slice! *attrs_to_keep
    assign_attributes(issue)

    self
  end
end

class Comment < ActiveRecord::Base
  GITHUB_ATTRIBUTES = %w{html_url url remote_id body path position line commit_id}.freeze

  validates :html_url, presence: true
  validates :url, presence: true
  validates :remote_id, presence: true, numericality: { only_integer: true }
  validates :body, presence: true
  validates :position, numericality: { only_integer: true, allow_blank: true }
  validates :line, numericality: { only_integer: true, allow_blank: true }

  def assign_filtered_attributes(github_event)
    comment = github_event.payload.comment.to_hash.with_indifferent_access
    comment[:remote_id] = github_event.payload.comment.id

    comment.slice! *GITHUB_ATTRIBUTES
    assign_attributes(comment)

    self
  end
end

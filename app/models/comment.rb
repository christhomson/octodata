class Comment < ActiveRecord::Base
  validates :html_url, presence: true
  validates :url, presence: true
  validates :remote_id, presence: true, numericality: { only_integer: true }
  validates :body, presence: true
  validates :position, numericality: { only_integer: true, allow_blank: true }
  validates :line, numericality: { only_integer: true, allow_blank: true }

  def assign_filtered_attributes(github_event)
    comment = github_event.payload.comment.to_hash.with_indifferent_access
    comment[:remote_id] = github_event.payload.comment.id

    attrs_to_keep = %w{html_url url remote_id body path position line commit_id}
    comment.slice! *attrs_to_keep
    assign_attributes(comment)

    self
  end
end

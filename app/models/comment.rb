class Comment < ActiveRecord::Base
  validates :html_url, presence: true
  validates :url, presence: true
  validates :remote_id, presence: true, numericality: { only_integer: true }
  validates :body, presence: true
  validates :position, numericality: { only_integer: true, allow_blank: true }
  validates :line, numericality: { only_integer: true, allow_blank: true }
end

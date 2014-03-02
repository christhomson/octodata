class Download < ActiveRecord::Base
  belongs_to :repository

  validates :url, presence: true
  validates :html_url, presence: true
  validates :remote_id, presence: true, numericality: { only_integer: true }, uniqueness: { scope: :repository }
  validates :name, presence: true
  validates :size, presence: true, numericality: true
  validates :download_count, presence: true, numericality: true
  validates :content_type, presence: true
end

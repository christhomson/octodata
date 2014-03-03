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
end

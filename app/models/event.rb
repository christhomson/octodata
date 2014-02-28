class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :import
  belongs_to :repository

  validates :event_type, presence: true
  validates :remote_id, presence: true
  validates :repository_id, presence: true
end

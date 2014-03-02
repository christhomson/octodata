class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :import
  belongs_to :repository

  validates :type,          presence: true
  validates :remote_id,     presence: true, uniqueness: { scope: :type }
  validates :user_id,       presence: true
  validates :import_id,     presence: true
  validates :raw_data,      presence: true

  scope :recent, -> { reorder('occurred_at desc') }
end

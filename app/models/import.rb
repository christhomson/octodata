class Import < ActiveRecord::Base
  belongs_to :user
  has_many :events

  validates :user_id, presence: true

  PAGE_LIMIT = 10 # imposed by GitHub
end

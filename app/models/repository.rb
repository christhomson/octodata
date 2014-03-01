class Repository < ActiveRecord::Base
  has_many :events
  has_many :users, -> { uniq }, as: :actors, through: :events

  validates :name, presence: true
  validates :owner, presence: true
  validates :remote_id, presence: true, numericality: { only_integer: true }
  validates_uniqueness_of :name, scope: :owner, case_sensitive: false

  def display_name
    "#{owner}/#{name}"
  end

  def github_url
    "https://github.com/#{display_name}"
  end
end

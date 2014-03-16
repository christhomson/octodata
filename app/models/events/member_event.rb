class MemberEvent < Event
  belongs_to :repository

  validates :repository, presence: true
  validates :action, presence: true
  validates :target_user, presence: true

  def github_event=(github_event)
    self.action = github_event.payload.action
    self.target_user = github_event.payload.member.login
  end
end

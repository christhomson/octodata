class GitHubImportJob
  @queue = :github

  def perform(user)
    begin
      github = user.github_client
      events = github.activity.events.performed(user.username)

      events.each do |event|
        e = Event.from_hash(user, event)
        break unless e.valid?
        e.save!
      end

    ensure
      Resque.enqueue_in(2.hours, GitHubImportJob, user)
    end
  end
end

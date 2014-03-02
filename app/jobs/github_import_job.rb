class GitHubImportJob
  @queue = :github

  def perform(user)
    begin
      github = user.github_client
      page = 1
      import = user.imports.create!
      Rails.logger.info "Started import for #{user.username}."

      Import::PAGE_LIMIT.times do
        Rails.logger.info "Importing page #{page} for #{user.username}."
        events = github.activity.events.performed(user.username, page: page)

        events.each do |event|
          next unless event.type == 'PushEvent' || event.type == 'CommitCommentEvent'
          e = Event.from_github(event, user, import)
          return unless e.valid?
          e.save!
        end

        page += 1
      end

    ensure
      Rails.logger.info "Finished import for #{user.username}."
      Resque.enqueue_in(2.hours, GitHubImportJob, user)
    end
  end
end

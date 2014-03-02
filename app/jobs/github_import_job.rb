class GitHubImportJob
  @queue = :github

  def perform(user)
    begin
      github = user.github_client
      import = user.imports.create!
      Rails.logger.info "Started import for #{user.username}."

      Import::PAGE_LIMIT.times do |page|
        Rails.logger.info "Importing page #{page + 1} for #{user.username}."
        events = github.activity.events.performed(user.username, page: page + 1)

        events.each do |event|
          next unless ['PushEvent', 'ForkEvent', 'CommitCommentEvent'].include? event.type
          e = Event.from_github(event, user, import)
          return unless e.valid?
          e.save!
        end
      end

    ensure
      Rails.logger.info "Finished import for #{user.username}."
      Resque.enqueue_in(2.hours, GitHubImportJob, user)
    end
  end
end

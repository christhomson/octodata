class GitHubImportJob
  @queue = :github

  def self.perform(username)
    user = User.find_or_create_by(username: username)

    begin
      github = user.github_client
      import = user.imports.create!
      Rails.logger.info "Started import for #{user.username}."

      Import::PAGE_LIMIT.times do |page|
        Rails.logger.info "Importing page #{page + 1} for #{user.username}."
        events = github.activity.events.performed(user.username, page: page + 1)

        events.each do |event|
          e = Event.from_github(event, user, import)
          next if Event::EXCLUDED_TYPES.include? e.type
          return unless e.valid?
          e.save!
        end
      end

    ensure
      Rails.logger.info "Finished import for #{user.username}."
      Resque.enqueue_in(2.hours, GitHubImportJob, username)
    end
  end
end

class GitHubImportJob
  @queue = :github

  def perform(user)
    begin
      # TODO

    ensure
      Resque.enqueue_in(2.hours, GitHubImportJob, user)
    end
  end
end

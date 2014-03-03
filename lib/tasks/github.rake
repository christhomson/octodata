namespace :github do
  task enqueue_all: :environment do
    User.all.each do |user|
      Resque.enqueue(GitHubImportJob, user.username)
    end
  end
end

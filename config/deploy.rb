lock '3.1.0'

set :stage, :production
set :rails_env, fetch(:stage)
set :application, 'octodata'
set :repo_url, 'git@github.com:christhomson/octodata.git'

set :branch, 'capistrano' # TODO - for now only.
set :deploy_to, "/home/deploy/apps/#{fetch(:application)}"

set :linked_files, %w{config/database.yml config/settings.yml}
set :keep_releases, 20

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      within release_path do
        execute :bundle, 'exec thin restart'
      end
    end
  end

  after :publishing, :restart
end

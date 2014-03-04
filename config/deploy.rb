require 'bundler/vlad'

set :application, "octodata"
set :repository, "git@github.com:christhomson/octodata.git"
set :user, "deploy"
set :domain, "#{user}@deploy.cthomson.ca"
set :deploy_to, "/home/deploy/apps/octodata"
set :revision, "origin/master"

shared_paths.merge!({"production.sqlite3" => "db/production.sqlite3"})
# On the server side, the upstart scripts should be installed to /etc/init.
# We also need to allow the "[start|stop|restart] [thin]" commands with no password for this user.

namespace :vlad do
  namespace :thin do
    remote_task :start, roles: :app do
      puts "Starting Thin..."
      sudo "start octodata_thin"
    end

    remote_task :stop, roles: :app do
      puts "Attempting to stop Thin..."
      sudo "stop octodata_thin"
    end

    remote_task :restart, roles: :app do
      puts "Restarting Thin..."
      sudo "restart octodata_thin"
    end
  end

  remote_task :update_cron, roles: :app do
    run "cd #{current_path}; bundle exec whenever --update-crontab"
  end

  remote_task :symlink_config, roles: :app do
    files = %w{database.yml settings.yml}

    files.each do |file|
      run "touch #{shared_path}/#{file}; ln -s #{shared_path}/#{file} #{release_path}/config/#{file}"
    end
  end

  task :deploy => [
    "vlad:update",
    "vlad:bundle:install",
    "vlad:symlink_config",
    "vlad:migrate",
    "vlad:update_cron",
    "vlad:thin:restart",
    "vlad:cleanup"
  ]

  task :start => [
    "vlad:thin:restart",
  ]
end

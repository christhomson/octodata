# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

begin
  require 'vlad'
  Vlad.load(app: nil, scm: :git, web: nil)

rescue LoadError
end

require File.expand_path('../config/application', __FILE__)
require 'resque/tasks'

Octodata::Application.load_tasks

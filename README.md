octodata
========
[![Build Status on Travis CI](https://travis-ci.org/christhomson/octodata.png?branch=master)](https://travis-ci.org/christhomson/octodata)
[![Dependency Status on Gemnasium](https://gemnasium.com/christhomson/octodata.png)](https://gemnasium.com/christhomson/octodata)
[![Code Climate](https://codeclimate.com/github/christhomson/octodata.png)](https://codeclimate.com/github/christhomson/octodata)
[![Coverage Status](https://coveralls.io/repos/christhomson/octodata/badge.png?branch=master)](https://coveralls.io/r/christhomson/octodata?branch=master)

Octodata was created out of a desire to analyze my GitHub activity/habits better. Currently, Octodata only serves as an endpoint that accepts events via GitHub webhooks and stores them in a database. It has a disturbingly ugly view of all events that GitHub has ever sent it. Eventually, I want to turn this into a web app that actually displays some interesting statistics and trends.

## Getting started
1. `git clone git@github.com:christhomson/octodata.git`
2. `cd octodata`
3. `bundle install`
4. `cp config/database.yml.example config/database.yml`
5. `cp config/settings.yml.example config/settings.yml`
6. [Register an application on
GitHub](https://github.com/settings/applications/new) (callback URL:
`http://localhost:3000/auth/github/callback`).
7. Edit `config/settings.yml` to add your GitHub API key and secret.
8. `bundle exec rails server`

## Tests
You can run the tests with `bundle exec rake test`.

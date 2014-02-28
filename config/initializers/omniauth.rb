Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, Rails.configuration.settings[:github][:key], Rails.configuration.settings[:github][:secret], scope: 'user,repo,gist'
end

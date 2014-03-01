if ENV['SECRET_TOKEN']
  Octodata::Application.config.secret_key_base = ENV['SECRET_TOKEN']
else
  Rails.logger.warn "Please set your config.secret_key_base."
  Octodata::Application.config.secret_key_base = "not_so_secret"
end

Resque.redis = Rails.configuration.settings[:redis][:url]
Dir["#{Rails.root}/app/jobs/*.rb"].each { |file| require file }

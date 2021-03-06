filename = File.join(Rails.root, "config/settings.yml")

if File.exist?(filename)
  Rails.configuration.settings = YAML.load(File.read(filename))[Rails.env].with_indifferent_access
else
  Rails.logger.fatal "Could not find config/settings.yml."
  Rails.configuration.settings = {}
end

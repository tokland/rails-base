require 'ostruct'
require 'yaml'

app_config = YAML.load_file(File.join(Rails.root, "config/app_config.yml"))
AppConfig = OpenStruct.new(app_config.fetch(Rails.env))

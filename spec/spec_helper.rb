ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/rails'
require 'factory_girl'

Capybara.javascript_driver = :webkit #:webkit | :selenium
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.mock_with :rspec # :spec | :mocha | :flexmock | :rr
  config.use_transactional_fixtures = true
  config.include Devise::TestHelpers, :type => :controller
end

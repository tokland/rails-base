require 'spork'
ENV["RAILS_ENV"] ||= 'test'

Spork.prefork do
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'capybara/rspec'
  require 'capybara/rails'
  require 'factory_girl'
  require "cancan/matchers"
  Dir.glob(File.join(Rails.root, "spec/support/*.rb")).each { |file| require(file) }
  
  Capybara.javascript_driver = :webkit # :webkit | :selenium

  RSpec.configure do |config|
    config.mock_with :rspec # :rspec | :mocha | :flexmock | :rr
    config.use_transactional_fixtures = true
    config.include Devise::TestHelpers, :type => :controller
    config.include Senergy::AppHelpers
    config.include FactoryGirl::Syntax::Methods
    config.extend ControllerMacros, :type => :controller
  end
end

Spork.each_run do
  load "#{Rails.root}/config/routes.rb"
  FactoryGirl.reload
end

load "support/capybara_shared_connection.rb"

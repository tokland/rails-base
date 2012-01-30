require 'spork'
ENV["RAILS_ENV"] ||= 'test'

Spork.prefork do
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'capybara/rspec'
  require 'capybara/rails'
  require 'factory_girl'
  require 'html_validator'

  Capybara.javascript_driver = :webkit #:webkit | :selenium
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.mock_with :rspec # :spec | :mocha | :flexmock | :rr
    config.use_transactional_fixtures = true
    config.include Devise::TestHelpers, :type => :controller
  end
end

Spork.each_run do
  load "#{Rails.root}/config/routes.rb"
  Dir["#{Rails.root}/app/**/*.rb"].each { |f| load(f) }
  FactoryGirl.reload
end

# HACK: this way the capybara driver uses the same connection that the spec
class ActiveRecord::Base
  mattr_accessor :shared_connection
  @@shared_connection = nil

  def self.connection
    @@shared_connection || retrieve_connection
  end
end
ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection

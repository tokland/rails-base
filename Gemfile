source 'http://rubygems.org'

gem 'rails', '3.1.0'
gem 'sqlite3'
gem 'mysql2', '~> 0.3.7'
gem 'jquery-rails'
gem 'block_helpers', :git => 'git://github.com/fastcatch/block_helpers.git'
gem 'ruby-debug'
gem 'pry' # REPL alternative to Irb
gem 'simple_form' # simple wrapper to build forms
gem 'cancan' # authorization
gem 'clearance' # authentication
gem 'carrierwave' # file uploads
gem 'exception_notification' # send emails on exceptions
gem 'kaminari' # pagination
gem 'i18n_routing', '~> 0.5.0' # translate routes
gem 'default_value_for' # default values for AR
gem 'squeel' # AR wrapper over ARel
gem 'navvy' # Background jobs

#plugin 'preferential' # Wrapper for serialized attributes 

group :assets do
  gem 'sass-rails', ' ~> 3.1.0'
  gem 'coffee-rails', ' ~> 3.1.0'
  gem 'uglifier'
end

group :development do
  gem "rack-bug"
end

group :development, :test do
  gem 'rspec', '~>2.6.0'
  gem 'rspec-rails', '~>2.6.0'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
  gem 'capybara', '~> 1.0.0'
  gem 'capybara-webkit', '~> 0.6.1'
  gem 'be_valid_asset'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'hirb'
  gem 'timecop'
end

group :development, :preproduction, :production do
  gem "pry-remote"
end

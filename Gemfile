source 'http://rubygems.org'

gem 'rails', '3.2.0'
gem 'sqlite3'
gem 'mysql2', '~> 0.3.7'
gem 'jquery-rails', '~> 2.0.0'
gem "ruby-debug19", :require => "ruby-debug"

gem 'block_helpers', :git => 'git://github.com/fastcatch/block_helpers.git'
gem 'nokogiri' # XML/HTML parser-builder
gem 'pry' # REPL alternative to Irb
gem 'simple_form' # simple wrapper to build forms
gem 'cancan' # authorization
gem 'clearance' # authentication
gem 'carrierwave', '>= 0.5.8' # file uploads
gem 'exception_notification' # send emails on exceptions
gem 'kaminari' # pagination
#gem 'i18n_routing', '~> 0.5.0' # translate routes
gem 'default_value_for' # default values for AR
gem 'squeel' # AR wrapper over ARel
gem 'navvy' # Background jobs

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
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
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'hirb'
  gem 'timecop'
end

group :development, :preproduction, :production do
  gem "pry-remote"
end

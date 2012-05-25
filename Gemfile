source 'http://rubygems.org'

gem 'rails', '3.2.0'
gem 'sqlite3'
gem 'mysql2', '~> 0.3.7'
gem 'jquery-rails', '~> 2.0.0'
gem "ruby-debug19", :require => "ruby-debug"

gem 'nokogiri' # XML/HTML parser-builder
gem 'pry' # REPL alternative to Irb
#gem 'simple_form' # simple wrapper to build forms
gem 'cancan' # authorization
gem 'devise' # authentication
gem 'paperclip' # file uploads
#gem 'carrierwave', '>= 0.5.8' # file uploads
gem 'kaminari' # pagination
gem "rails-translate-routes"
gem 'default_value_for' # default values for AR
gem 'squeel' # AR wrapper over ARel
gem 'navvy' # Background jobs
gem 'activeadmin', :git => 'git://github.com/gregbell/active_admin.git' # check #931
gem 'sass-rails'
gem "meta_search", '>= 1.1.0.pre'
gem "bluecloth" # Markdown
gem 'exception_notification',  
  :git => 'git://github.com/smartinez87/exception_notification.git' # send emails on errors
 
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'execjs'
  gem 'therubyracer', :platforms => :ruby
end

group :development do
  gem "rack-bug"
end

group :development, :test do
  gem 'rspec', '~>2.8.0'
  gem 'rspec-rails', '~>2.8.1'
  gem 'webrat', '0.7.3'
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

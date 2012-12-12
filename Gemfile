source 'https://rubygems.org'

gem 'rails', '3.2.9'															# rails as framework

gem 'jquery-rails', '2.1.4'												# the jquery library for rails
gem "thin", "1.5.0"																#	the used web service
gem "bootstrap-sass", "2.2.1.1"										# bootstrap from twitter - sass
gem "omniauth", "1.1.1"														# an openauth/openid authenticator framework
gem "omniauth-openid"															# the openid plugin for openauth
gem "cancan", "1.6.8"															# a authorization library
gem "rolify", "3.2.0"															# a role management gem that plays well with mongoid
gem "simple_form", "2.0.4"												# a gem to create forms without using erb syntax
gem 'bcrypt-ruby', '3.0.1'												# To use ActiveModel has_secure_password or to create secure passwords
gem 'foreman', '0.60.2'														# helps to start up predefined multiple processes at once
gem 'action_args', '1.0.3'												# helps to specify arguments on a controller action
gem 'httparty', '0.9.0'														# used to talk to remote api's
gem 'nokogiri', '1.5.5'														# used to parse remote pages (if they don't have api's)

gem "mongoid", "3.0.14"														# the mongodb orm mapper and driver (moped included)
gem 'bson_ext', '1.8.0'														# the c-libraries for bson (for faster execution)
gem 'mongoid_rails_migrations', '1.0.0'						# can be used to migrate mongodb tables if really needed

group :assets do
  gem 'sass-rails', '3.2.5'												# the precompiler for sass files
  gem 'coffee-rails', '3.2.2'											# the precompiler for coffee files
  gem 'uglifier', '1.3.0'													# a compression library for css and js
end

group :development do
  gem "quiet_assets", "1.0.1"											# silences the assets pipeline output in development
  gem "better_errors", "0.2.0"										# replacement for the default rails error page (much much better!)
  gem "binding_of_caller", "0.6.8"								# more information for the better_errors page
  gem 'spork', '0.9.2'														# can run a service with preloaded rails environments to speed up rspec test runs
  gem 'guard-rspec', '2.3.1'											# a guard that runs rspec definitions on file change
  gem 'guard-shell'																# a guard with capability to interact with the shell
  gem 'guard-spork', '1.4.0'											# a guard / spork helper to couple this two things together
  gem 'brice', '0.2.5'														# enhance the irb output: http://prometheus.rubyforge.org/brice/
end

# these are the file system watchers for guard. if none of them are used guard will fall back to 'Listen'
group :development do
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false
end

group :test do
  gem "capybara", "2.0.1"													# helps to interact with the web site during tests
  gem "database_cleaner", "0.9.1"									# cleans the database before a test starts
  gem "mongoid-rspec", "1.5.5"										# the rspec test-matchers for mongoid
  gem "email_spec", "1.4.0"												# the rspec test-matchers for emails
end

group :development, :test do
  gem "rspec-rails", "2.12.0"											# the rspec test-matchers for rails
  gem "factory_girl_rails", "4.1.0"								# a replacement for the test-fixtures
  gem 'fuubar', '1.1.0'														# a rpsec output formatter
end
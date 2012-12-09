source 'https://rubygems.org'

gem 'rails', '3.2.9'									# rails as framework
gem 'bootstrap-sass', '2.2.1.1'				# bootstrap from twitter - sass
gem 'bcrypt-ruby', '3.0.1'						# To use ActiveModel has_secure_password or to create secure passwords
gem 'thin', '1.5.0'										#	the used web service
gem 'foreman', '0.60.2'								# helps to start up predefined multiple processes at once
gem 'jquery-rails', '2.1.4'						# the jquery library for rails
gem 'action_args', '1.0.3'						# helps to specify arguments on a controller action

# the mongodb extensions
gem 'mongoid', '3.0.14'
gem 'bson_ext', '1.8.0'
gem 'mongoid-rspec', '1.5.5'
gem 'mongoid_rails_migrations', '1.0.0'

gem 'omniauth', '1.1.1'
gem 'omniauth-openid', '1.0.1'

gem 'httparty', '0.9.0'
gem 'nokogiri', '1.5.5'

group :development, :test do
  gem 'rspec-rails', '2.12.0'					# the rspec for rails
  gem 'spork', '0.9.2'								# can run a service with preloaded rails environments to speed up rspec test runs
  gem 'fuubar', '1.1.0'								# a rpsec output formatter
  gem 'guard-rspec', '2.3.1'					# a guard that runs rspec definitions on file change
  gem 'guard-spork', '1.4.0'					# a guard / spork helper to couple this two things together
  gem 'brice', '0.2.5'								# enhance the irb output: http://prometheus.rubyforge.org/brice/
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '3.2.5'						# enables the sass asset pipeline compilation
  gem 'coffee-rails', '3.2.2'					# enables the coffee-script asset pipeline compilation
  gem 'uglifier', '1.3.0'							# helps to compress and uglify js files
end

group :test do
  gem 'capybara', '2.0.1'							# helps to test browser interaction
  gem 'factory_girl_rails', '4.1.0'		# helps to create models during testing
end
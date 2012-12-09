source 'https://rubygems.org'

# rails as framework
gem 'rails', '3.2.9'
# bootstrap from twitter - sass
gem 'bootstrap-sass', '2.0.4'
# To use ActiveModel has_secure_password or to create secure passwords
gem 'bcrypt-ruby', '3.0.1'
# the used web service
gem 'thin', '1.5.0'
# helps to start up predefined multiple processes at once
gem 'foreman', '0.60.2'
# the jquery library for rails
gem 'jquery-rails', '2.0.2'
# helps to specify arguments on a controller action
# instead checking the params hash all the time
gem 'action_args'

# the mongodb extensions
gem 'mongoid'
gem 'bson_ext'
gem 'mongoid-rspec'
gem 'mongoid_rails_migrations'

gem 'omniauth'
gem 'omniauth-openid'

gem 'httparty'
gem 'nokogiri'

group :development, :test do
  # the rspec for rails
  gem 'rspec-rails', '2.11.0'
  # can run a service with preloaded rails 
  # environments to speed up rspec test runs
  gem 'spork', '0.9.2'
  # a rpsec output formatter
  gem 'fuubar', '1.1.0'
  # a guard that runs rspec definitions on file change
  gem 'guard-rspec', '1.2.1'
  # a guard / spork helper to couple this two things together
  gem 'guard-spork', '1.2.0'
  # enhance the irb output
  # read this: http://prometheus.rubyforge.org/brice/
  gem 'brice'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '3.2.5'
  gem 'coffee-rails', '3.2.2'
  # helps to compress and uglify js files
  gem 'uglifier', '1.2.3'
end

group :test do
  # helps to test browser interaction
  gem 'capybara', '1.1.2'
  # helps to create models during testing
  gem 'factory_girl_rails', '4.1.0'
end
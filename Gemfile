source 'https://rubygems.org'

# force ruby to be installed in a specific version - dont write it in the same line
ruby '1.9.3'

gem 'rails', '3.2.12'                             # rails as framework

gem 'jquery-rails', '2.2.0'                       # the jquery library for rails
gem 'bootstrap-sass', '2.2.2'                     # bootstrap from twitter - sass
gem 'omniauth', '1.1.1'                           # an openauth/openid authenticator framework
gem 'omniauth-openid'                             # the openid plugin for openauth
gem 'cancan', '1.6.8'                             # a authorization library
gem 'rolify', '3.2.0'                             # a role management gem that plays well with mongoid
gem 'simple_form', '2.0.4'                        # a gem to create forms without using erb syntax
gem 'bcrypt-ruby', '3.0.1'                        # To use ActiveModel has_secure_password or to create secure passwords
gem 'foreman', '0.61.0'                           # helps to start up predefined multiple processes at once
gem 'action_args', '1.0.4'                        # helps to specify arguments on a controller action
gem 'httpclient', '2.3.2'                         # used to talk to remote api's
gem 'nokogiri', '1.5.6'                           # used to parse remote pages (if they don't have api's)
gem 'haml', '3.1.7'                               # the compiler for haml files

gem 'rails_admin', '0.4.4'                        # a administration dashboard ready to use
#gem 'rails_admin_histeroid', '0.0.2'              # the user action protocol for rails admin
# as long as it does not work. requires mongoid 3.1.0 -> symbolize does not work with that version atm!

gem 'newrelic_rpm'                                # helps to instrument the application with 'new relic' service

#gem 'figaro', '0.5.0'                             # helps to manage environment variables
# use the 'ERB in Figaro' fork as long the pull request https://github.com/laserlemon/figaro/pull/19 is still open and not published
gem 'figaro', git: 'https://github.com/SeriousM/figaro.git', ref: '46e999e88664a99386964e3deb5a01e8a6c67ae7'

gem 'mongoid', '3.1.1'                            # the mongodb orm mapper and driver (moped included)
gem 'bson_ext'                                    # the c-libraries for bson (for faster execution)
gem 'mongoid_rails_migrations', '1.0.0'           # can be used to migrate mongodb tables if really needed

# Helps to have a kind of enumeration in mongodb
gem 'symbolize', '4.3.1', :require => 'symbolize/mongoid'

gem 'public_activity', '1.0.3'                    # an activity feed plugin

# Games related gems
gem 'battlenet', '1.4.0'                          # the battlenet api (wow)
gem 'bf3', '0.0.1'                                # the battlefield 3 api (bf3)

group :assets do
  gem 'sass-rails', '3.2.6'                       # the precompiler for sass files
  gem 'coffee-rails', '3.2.2'                     # the precompiler for coffee files
  gem 'uglifier', '1.3.0'                         # a compression library for css and js
end

group :production do
  platforms :ruby do # linux
    gem 'unicorn', '4.5.0'                        # a web server for the production
  end
end

group :development do
  gem 'genghisapp', '2.1.6', require: 'genghis'   # a mongodb maintenance application (also for non-localhost)
  gem 'pry', '0.9.11'                             # alternative for IRb -> http://railscasts.com/episodes/280
                                                  # call 'pry -r ./config/environment'
  gem 'pry-doc', '0.4.4'                          # enables to load source from c-libraries too
  gem 'pry-rails', '0.2.2'                        # pry ready to use -> call 'rails console' to run pry
  gem 'meta_request', '0.2.1'                     # enables the rails panel communication: https://github.com/dejan/rails_panel
  gem 'thin', '1.5.0'                             # the used web service
  gem 'quiet_assets', '1.0.1'                     # silences the assets pipeline output in development
  gem 'spork', '0.9.2'                            # can run a service with preloaded rails environments to speed up rspec test runs
  gem 'guard-rspec', '2.4.0'                      # a guard that runs rspec definitions on file change
  gem 'guard-shell', '0.5.1'                      # a guard with capability to interact with the shell
  gem 'guard-spork', '1.4.1'                      # a guard / spork helper to couple this two things together
  gem 'better_errors', '0.6.0'                    # replacement for the default rails error page (much much better!)
  gem 'binding_of_caller', '0.7.1'                # more information for the better_errors page
end

# these are the file system watchers for guard. if none of them are used guard will fall back to 'Listen'
group :development do
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false
end

group :test do
  gem 'capybara', '2.0.2'                         # helps to interact with the web site during tests
  gem 'database_cleaner', '0.9.1'                 # cleans the database before a test starts
  gem 'mongoid-rspec', '1.5.6'                    # the rspec test-matchers for mongoid
  gem 'email_spec', '1.4.0'                       # the rspec test-matchers for emails
  gem 'webmock', '< 1.9'                          # used to stub/mock web requests in tests
  gem 'vcr', '2.4.0'                              # can record and reply web requests
end

group :development, :test do
  gem 'rspec-rails', '2.12.2'                     # the rspec test-matchers for rails
  gem 'shoulda', '3.3.2'                          # a matcher collection and helper for rspec
  gem 'fabrication', '2.5.4'                      # a replacement for factory girl because it does not work with mongoid
  gem 'fuubar', '1.1.0'                           # a rpsec output formatter
  gem 'git', '1.2.5'                              # a git gem to interact with git repositories
end
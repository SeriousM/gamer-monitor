require 'vcr'

VCR.configure do |c|
  c.hook_into :webmock
  c.cassette_library_dir = 'spec/cassettes'
  # :new_episodes = add new requests to the same cassette
  c.default_cassette_options = { :record => :new_episodes, :erb => true }
  # dont raise exceptions when no cassette is in the tray
  c.allow_http_connections_when_no_cassette = true
  # ignore local host calls (local development)
  c.ignore_localhost = true
  # any rspec spec with the tag :vcr is wrapped with a vcr cassette.
  # -> https://www.relishapp.com/vcr/vcr/docs/test-frameworks/usage-with-rspec-metadata
  c.configure_rspec_metadata!
end

# dont raise exceptions when the http connection is unexpected (turn off with WebMock.disable_net_connect!)
WebMock.allow_net_connect!
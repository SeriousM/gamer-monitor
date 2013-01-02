require 'spec_helper'

describe "VCR with WebMock" do
  
  VCR.use_cassette('heroku') do

    describe "when loading the heroku landing page" do
      response = HTTPClient.get "https://www.heroku.com"
      subject { response }

      its(:body) { should match /.*<h1>cloud application platform<\/h1>.*/ }
      its(:body) { should match /.*<h2>deploy and scale powerful apps<\/h2>.*/ }

      a_request(:get, "https://www.heroku.com").should have_been_made
    end

    describe "when loading the contact page" do
      response = HTTPClient.get "https://www.heroku.com/contact"
      subject { response }

      its(:body) { should match /.*What can we help you with?.*/ }

      a_request(:get, "https://www.heroku.com/contact").should have_been_made
    end
  end
end
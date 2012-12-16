require 'spec_helper'

describe Game do
  
  let(:game) {Fabricate(:game)}
  
  subject { game }
  
  it { should have_field(:name).of_type(String) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should have_index_for(name: 1).with_options(unique: true) }
  it { should be_timestamped_document.with(:created) }
  it { should be_timestamped_document.with(:updated) }
  
  describe "when name is not present" do
    before { game.name = " " }
    it { should_not be_valid }
  end
  
  describe "when saved the first time" do
    before { game.save! }
    it { should_not be_new_record }
  end
end
require 'spec_helper'

describe WotCharacter do
  
  let(:wot_character) {Fabricate(:wot_character)}
  
  subject { wot_character }
  
  it { should have_field(:name).of_type(String) }
  it { should have_field(:account_id).of_type(Integer) }
  it { should be_timestamped_document.with(:created) }
  it { should be_timestamped_document.with(:updated) }
  
  describe "when name is not present" do
    before { wot_character.name = " " }
    it { should_not be_valid }
  end
  
  describe "when saved the first time" do
    before { wot_character.save! }
    it { should_not be_new_record }
  end
end
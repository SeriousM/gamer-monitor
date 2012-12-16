require 'spec_helper'

describe WowCharacter do
  
  let(:wow_character) {Fabricate(:wow_character)}
  
  subject { wow_character }
  
  it { should have_field(:name).of_type(String) }
  it { should have_field(:server).of_type(String) }
  it { should be_timestamped_document.with(:created) }
  it { should be_timestamped_document.with(:updated) }
  
  describe "when name is not present" do
    before { wow_character.name = " " }
    it { should_not be_valid }
  end
  
  describe "when saved the first time" do
    before { wow_character.save! }
    it { should_not be_new_record }
  end
end
require 'spec_helper'

describe User do
  
  let(:user) {Fabricate(:user)}
  
  subject { user }
  
  it { should have_field(:name).of_type(String) }
  it { should have_field(:uid).of_type(String) }
  it { should have_field(:provider).of_type(String) }
  it { should have_field(:email).of_type(String) }
  
  describe "when name is not present" do
    before { user.name = " " }
    it { should_not be_valid }
  end
  
  describe "and a wow character will be added" do
    let (:wow_character) { Fabricate(:wow_character) }
    
    subject { user.wow_characters }
    it {
    	expect{ user.wow_characters << wow_character }.to change(user.wow_characters, :count).by(1)
    }
  end
end
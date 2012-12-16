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
  
  describe "when a game will be added" do
    let(:game) { Fabricate(:game) }
    
    it {
    	expect { user.games << game }.to change(user.games, :count).by(1)
    }
    
    describe "and a game character will be added" do
      let (:wow_character) { Fabricate(:wow_character) }
      
      subject { game.characters }
      it {
      	expect{ game.characters << wow_character }.to change(game.characters, :count).by(1)
      }
      
      #its([:games].first.characters.for_wow) {
      #  expect { game.characters << wow_character }.to change([:games].first.characters.for_wow, :count).by(1)
      #}
    end
  end
end
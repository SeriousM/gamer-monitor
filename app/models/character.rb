class Character
  include Mongoid::Document
  include Mongoid::Timestamps
  
  belongs_to :game
  belongs_to :user
end

class WowCharacter < Character
  field :server, type: String
  field :name, type: String
  
  attr_accessible :name, :server
  validates_presence_of :name, :server
end
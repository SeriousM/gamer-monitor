class WowCharacter
  include Mongoid::Document
  include Mongoid::Timestamps

  field :server, type: String
  field :name, type: String

  belongs_to :user
  
  attr_accessible :name, :server
  validates_presence_of :name, :server
end
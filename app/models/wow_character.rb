class WowCharacter
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Symbolize

  field :server, type: String
  field :name, type: String
  symbolize :region, :in => [:us, :eu], :scopes => true

  belongs_to :user
  
  attr_accessible :name, :server, :region, :user_id
  validates_presence_of :name, :server, :region, :user_id
end
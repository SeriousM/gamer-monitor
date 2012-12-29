class WotCharacter
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Symbolize

  field :account_id, type: Integer
  field :name, type: String
  symbolize :region, :in => [:world, :eu], :scopes => true

  belongs_to :user
  
  attr_accessible :name, :account_id, :region, :user_id
  validates_presence_of :name, :id, :region, :user_id, :account_id
end
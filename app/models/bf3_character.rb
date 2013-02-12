class Bf3Character
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Symbolize

  field :name, type: String
  symbolize :platform, :in => [:pc, :xbox360, :ps3], :scopes => true

  belongs_to :user
  
  attr_accessible :name, :platform
  validates_presence_of :name, :platform
end
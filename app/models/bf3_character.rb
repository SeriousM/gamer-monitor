class Bf3Character
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Symbolize

  embeds_one :bf3_character_sheet

  field :name, type: String
  symbolize :platform, :in => [:pc, :xbox360, :ps3], :scopes => true

  belongs_to :user
  
  attr_accessible :name, :platform
  validates_presence_of :name, :platform

  def has_details?
    bf3_character_sheet?
  end
end
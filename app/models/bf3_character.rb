class Bf3Character
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Symbolize

  embeds_one :bf3_character_sheet
  accepts_nested_attributes_for :bf3_character_sheet

  field :name, type: String
  symbolize :platform, :in => [:pc, :xbox360, :ps3], :scopes => true

  belongs_to :user
  
  attr_accessible :name, :platform, :user_id, :bf3_character_sheet_attributes
  validates_presence_of :name, :platform, :user_id

  def has_details?
    bf3_character_sheet?
  end
end
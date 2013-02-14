class WowCharacter
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Symbolize

  embeds_one :wow_character_sheet
  accepts_nested_attributes_for :wow_character_sheet
  
  field :server, type: String
  field :name, type: String
  symbolize :region, :in => [:us, :eu], :scopes => true

  belongs_to :user
  
  attr_accessible :name, :server, :region, :user_id, :wow_character_sheet_attributes
  validates_presence_of :name, :server, :region, :user_id

  def server_safe
    server.gsub('\'', "")
  end

  def has_details?
    wow_character_sheet?
  end
end
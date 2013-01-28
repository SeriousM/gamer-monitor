class WowCharacterSheet
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :wow_character
  
  field :level, type: Integer
  field :thumbnail, type: String

  attr_accessible :level, :thumbnail
end
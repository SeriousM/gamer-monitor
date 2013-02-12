class Bf3CharacterSheet
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :bf3_character
  
  field :rank_name, type: String
  field :rank_image, type: String

  attr_accessible :rank_name, :rank_image
end
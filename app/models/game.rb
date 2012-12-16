class Game
  include Mongoid::Document
  include Mongoid::Timestamps
  
  has_and_belongs_to_many :users
  has_many :characters do
    def for_wow
      @target.select { |c| c._type == "WowCharacter"}
    end
  end
    
  field :name, type: String
  
  attr_accessible :name
  
  index({ name: 1 }, { unique: true, background: true })
  
  validates_presence_of :name
  validates_uniqueness_of :name
end
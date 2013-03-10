class User
  include Mongoid::Document
  include Mongoid::Timestamps

  include PublicActivity::Common

  has_many :wow_characters
  has_many :wot_characters
  has_many :bf3_characters

  rolify
  
  field :provider, type: String
  field :uid, type: String
  field :name, type: String
  field :email, type: String
  
  attr_accessible :role_ids
  attr_accessible :provider, :uid, :name, :email, :wow_character_ids, :wot_character_ids, :bf3_character_ids
  
  index({ uid: 1, provider: 1 }, { unique: true, background: true })
  
  validates_presence_of :provider, :uid, :name, :email
  validates_uniqueness_of :uid

  def self.create_with_omniauth(auth)
    new_user = create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
        # todo: raise an error if the name or email is missing
        user.name = auth['info']['name']
        user.email = auth['info']['email']
      end
    end
    
    new_user.create_activity :signed_up, owner: new_user
    new_user
  end
end
class User
  include Mongoid::Document
  include Mongoid::Timestamps
  
  has_many :wow_characters

  rolify
  
  field :provider, type: String
  field :uid, type: String
  field :name, type: String
  field :email, type: String
  
  attr_accessible :role_ids
  attr_accessible :provider, :uid, :name, :email
  
  index({ uid: 1, provider: 1 }, { unique: true, background: true })
  
  validates_presence_of :provider, :uid, :name, :email
  validates_uniqueness_of :uid

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
        # todo: raise an error if the name or email is missing
        user.name = auth['info']['name']
        user.email = auth['info']['email']
      end
    end
  end
end
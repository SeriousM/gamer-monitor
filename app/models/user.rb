class User
  include Mongoid::Document
  include Mongoid::Timestamps
  rolify
  field :provider, type: String
  field :uid, type: String
  field :name, type: String
  field :email, type: String
  attr_accessible :role_ids, :as => :admin
  attr_accessible :provider, :uid, :name, :email
  # run 'rake db:mongoid:create_indexes' to create indexes
  index({ email: 1 }, { unique: true, background: true })

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
        # todo: raise an error if the name or email is missing
        user.name = auth['info']['name'] || ""
        user.email = auth['info']['email'] || ""
      end
    end
  end

end

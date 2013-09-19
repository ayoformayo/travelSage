class User < ActiveRecord::Base
  has_many :articles
  has_many :identities
  def self.create_with_omniauth(info)
    User.create(name: info['name'])
  end
end

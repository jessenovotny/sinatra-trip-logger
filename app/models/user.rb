class User < ActiveRecord::Base
  has_many :trips
  has_many :states, :through => :trips
  has_many :sports, :through => :trips

  def slug
    username.downcase.gsub(" ", "-")
  end

  def self.find_by_slug slug
    User.where('lower(username) = ?', slug.split("-").join(' ').downcase).first
  end
end
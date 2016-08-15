class State < ActiveRecord::Base
  has_many :trips
  has_many :users, :through => :trips
  has_many :sports, :through => :trips

  def slug
    name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug slug
    State.where('lower(name) = ?', slug.split("-").join(' ').downcase).first
  end
end
class State < ActiveRecord::Base
  has_many :trips
  has_many :users, :through => :trips
  has_many :sports, :through => :trips
end
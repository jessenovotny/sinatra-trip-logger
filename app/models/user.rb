class User < ActiveRecord::Base
  has_many :trips
  has_many :states, :through => :trips
  has_many :sports, :through => :trips
end
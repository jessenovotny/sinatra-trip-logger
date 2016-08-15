class Sport < ActiveRecord::Base
  has_many :trips
  has_many :users, :through => :trips
  has_many :states, :through => :trips
end
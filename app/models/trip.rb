class Trip < ActiveRecord::Base
  belongs_to :user
  belongs_to :state
  belongs_to :sport
end
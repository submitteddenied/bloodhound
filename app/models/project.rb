class Project < ActiveRecord::Base
  attr_accessible :name, :api_key
  
  has_many :pivotal_tracker_activities
end

class Project < ActiveRecord::Base
  attr_accessible :name, :api_key
  
  has_many :pivotal_tracker_activities
  
  def generate_key
    self.api_key = SecureRandom.hex(8)
  end
end

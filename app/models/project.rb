class Project < ActiveRecord::Base
  attr_accessible :name, :api_key, :password
  
  has_many :pivotal_tracker_activities
  has_many :github_activities

  validates_presence_of :name

  validates :password, presence: true, length: { minimum: 6 }
  
  def generate_key
    self.api_key = SecureRandom.hex(8)
  end

  def activities
    (GithubActivity.where(project_id: id) + PivotalTrackerActivity.where(project_id: id)).sort do |x, y|
      y.occurred_at <=> x.occurred_at
    end
  end
end

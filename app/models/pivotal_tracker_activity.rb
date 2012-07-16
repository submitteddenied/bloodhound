class PivotalTrackerActivity < ActiveRecord::Base
  attr_accessible :pt_id, :version, :event_type, :occurred_at, :author, :project_id, :description, :project_id

  def self.from_xml

  end
end

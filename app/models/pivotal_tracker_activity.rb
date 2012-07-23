class PivotalTrackerActivity < ActiveRecord::Base
  attr_accessible :pt_id, :version, :event_type, :occurred_at, :author, :project_id, :description, :project_id, :story_id, :story_url

  def self.from_api(data)
    activities = []
    data = data['activity']
    data['stories'].each do |story|
      activities << PivotalTrackerActivity.create(
        author:      data['author'],
        pt_id:       data['project_id'],
        version:     data['version'],
        event_type:  data['event_type'],
        occurred_at: data['occurred_at'],
        description: data['description'],
        story_id:    story['id'],
        story_url:   story['url']
      )
      logger.info "Created activity for story: #{story['id']}" unless activities[-1].new_record?
    end
    activities
  end
end

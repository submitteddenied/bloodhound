class PivotalTrackerActivity < ActiveRecord::Base
  attr_accessible :pt_id, :version, :event_type, :occurred_at, :author, :project_id, :description, :project_id, :story_id, :story_url

  def self.from_xml(xml)
    activities = []

    doc = Nokogiri.XML(xml)
    doc.xpath('//stories/story').each do |story|
      activities << self.create(
        author: doc.xpath("//activity/author").first.text(),
        pt_id: doc.xpath("//activity/project_id").first.text(),
        version: doc.xpath("//activity/version").first.text(),
        event_type: doc.xpath("//activity/event_type").first.text(),
        occurred_at: Time.parse(doc.xpath("//activity/occurred_at").first.text()),
        description: doc.xpath("//activity/description").first.text(),
        story_id: story.xpath('.//id').first.text(),
        story_url: story.xpath('.//url').first.text(),
      )
    end

    activities
  end
end

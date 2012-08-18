class PivotalTrackerActivityDecorator
  def initialize(activity)
    @activity = activity
  end

  def partial
    'pivotal_tracker_activity_story_update'
  end

  def event_tag
    r = %r{^#{@activity.author} (.*?)(:|")}
    m = r.match @activity.description
    m[1].strip
  end

  def author
    @activity.author
  end

  def story_title
    r = %r|^(.*?)(".*)|
    m = r.match @activity.description
    m[2]
  end

  def story_url
    @activity.story_url
  end

  def occurred_at
    @activity.occurred_at
  end
end
class PivotalTrackerActivityDecorator
  STORY_EVENTS = [
    'finished',
    'started',
    'estimated',
    'edited',
    'accepted',
    'rejected',
    'delivered',
    'added comment'
  ]

  def initialize(activity)
    @activity = activity
  end

  def partial
    return 'pivotal_tracker_activity_story_update'
  end

  def event_tag
    r = %r|^#{@activity.author} (.*)"|
    m = r.match @activity.description
    STORY_EVENTS.each do |event|
      return event if m[1] =~ %r{^#{event}}
    end
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
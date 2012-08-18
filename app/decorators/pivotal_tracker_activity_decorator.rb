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
    'pivotal_tracker_activity'
  end

  def event_tag
    r = %r|^#{@activity.author} (.*)"|
    m = r.match @activity.description
    STORY_EVENTS.each do |event|
      return event if m[1] =~ %r{^#{event}}
    end
    return ''
  end

  def author
    @activity.author
  end

  def story_title
    @activity.description
  end

  def occurred_at
    @activity.occurred_at
  end
end
class PivotalTrackerActivityDecorator
  STORY_EVENTS = [
    'finished',
    'started',
    'estimated',
    'edited',
    'accepted',
  ]

  def initialize(activity)
    @activity = activity
  end

  def partial
    'pivotal_tracker_activity'
  end

  def event_tag
    r = %r|^#{@activity.author} ([a-zA-Z]*) |
    m = r.match @activity.description
    m[1] if STORY_EVENTS.include?(m[1])
  end
end
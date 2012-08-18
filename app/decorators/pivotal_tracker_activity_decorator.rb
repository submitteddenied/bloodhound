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
    return 'pivotal_tracker_activity_story_update' if @activity.event_type == 'story_update'
    return 'pivotal_tracker_activity_note_create' if @activity.event_type == 'note_create'
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
    r = %r|^(.*?)"(.*?)"|
    m = r.match @activity.description
    m[2]
  end

  def occurred_at
    @activity.occurred_at
  end
end
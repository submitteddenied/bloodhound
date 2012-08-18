class PivotalTrackerActivityDecorator
  def initialize(activity)
    @activity = activity
  end

  def partial
    'pivotal_tracker_activity'
  end

  def event_type
    @activity.event_type
  end
end
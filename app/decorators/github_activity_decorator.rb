class GithubActivityDecorator
  def initialize(activity)
    @activity = activity
  end

  def partial
    'github_activity'
  end

  def author
    @activity.author_name
  end

  def url
    @activity.github_url
  end

  def message
    @activity.message
  end

  def event_tag
    'event'
  end

  def occurred_at
    @activity.occurred_at
  end
end
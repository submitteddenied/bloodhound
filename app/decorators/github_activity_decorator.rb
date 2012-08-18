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

  def occurred_at
    @activity.occurred_at
  end
end
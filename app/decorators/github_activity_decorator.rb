class GithubActivityDecorator
  def initialize(activity)
    @activity = activity
  end

  def partial
    'github_activity'
  end
end
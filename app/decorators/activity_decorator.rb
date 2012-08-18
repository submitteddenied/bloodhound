class ActivityDecorator
  def self.new(activity)
    case activity.class.to_s
      when 'GithubActivity'          then GithubActivityDecorator.new(activity)
      when 'PivotalTrackerActivity'  then PivotalTrackerActivityDecorator.new(activity)
    end
  end
end
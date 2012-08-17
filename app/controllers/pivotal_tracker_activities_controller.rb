class PivotalTrackerActivitiesController < ApplicationController
  def index
    @pivotal_tracker_activities = PivotalTrackerActivity.where(project_id: params[:project_id])
  end
end

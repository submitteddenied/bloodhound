class PivotalTrackerActivitiesController < ApplicationController
  def index
    @pivotal_tracker_activities = PivotalTrackerActivity.all
  end

  def show
    @pivotal_tracker_activity = PivotalTrackerActivity.find(params[:id])
  end

  def new
    @pivotal_tracker_activity = PivotalTrackerActivity.new
  end

  def create
    @pivotal_tracker_activity = PivotalTrackerActivity.new(params[:pivotal_tracker_activity])
    if @pivotal_tracker_activity.save
      redirect_to @pivotal_tracker_activity, :notice => "Successfully created pivotal tracker activity."
    else
      render :action => 'new'
    end
  end

  def edit
    @pivotal_tracker_activity = PivotalTrackerActivity.find(params[:id])
  end

  def update
    @pivotal_tracker_activity = PivotalTrackerActivity.find(params[:id])
    if @pivotal_tracker_activity.update_attributes(params[:pivotal_tracker_activity])
      redirect_to @pivotal_tracker_activity, :notice  => "Successfully updated pivotal tracker activity."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @pivotal_tracker_activity = PivotalTrackerActivity.find(params[:id])
    @pivotal_tracker_activity.destroy
    redirect_to pivotal_tracker_activities_url, :notice => "Successfully destroyed pivotal tracker activity."
  end
end

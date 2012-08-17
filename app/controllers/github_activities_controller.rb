class GithubActivitiesController < ApplicationController
  def index
    @github_activities = GithubActivity.where(project_id: params[:project_id])
  end
end

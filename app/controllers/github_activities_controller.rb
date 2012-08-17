class GithubActivitiesController < ApplicationController
  before_filter :authenticate

  def index
    @github_activities = GithubActivity.where(project_id: params[:project_id])
  end
end

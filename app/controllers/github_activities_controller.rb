class GithubActivitiesController < ApplicationController
  before_filter :authenticate

  def index
    @github_activities = GithubActivity.where(project_id: params[:project_id])
  end

  protected

  def authenticate
    project = Project.find(params[:project_id])
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == project.password
    end
  end
end

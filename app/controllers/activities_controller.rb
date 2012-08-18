class ActivitiesController < ApplicationController
  before_filter :authenticate

  def index
    activities = Project.find(params[:project_id]).activities
    @activities = activities.map { |activity| ActivityDecorator.new(activity) }
  end

  protected

  def authenticate
    project = Project.find(params[:project_id])
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == project.password
    end
  end
end

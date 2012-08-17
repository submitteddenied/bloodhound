class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate
    project = Project.find(params[:project_id])
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == project.password
    end
  end
end

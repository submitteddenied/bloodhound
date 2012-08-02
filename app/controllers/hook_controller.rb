class HookController < ApplicationController
  #POST hook/tracker/abcd1234
  def receive
    project = Project.find_by_api_key(params[:api_key])
    if params[:service] == 'tracker'
      project.pivotal_tracker_activities.from_api(params)
      render nothing: true, status: 201
    elsif params[:service] == 'github'
      project.github_activities.from_api(params)
      render nothing: true, status: 201
    else
      render nothing: true, status: 400
    end
  end
end

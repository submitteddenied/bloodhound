class HookController < ApplicationController
  #POST hook/tracker/abcd1234
  def receive
    project = Project.find_by_api_key(params[:api_key])
    project.pivotal_tracker_activities.from_xml(params[:body])
    
    render nothing: true, status: 201
  end
end

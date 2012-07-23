class GithubActivitiesController < ApplicationController
  def index
    @github_activities = GithubActivity.all
  end
end

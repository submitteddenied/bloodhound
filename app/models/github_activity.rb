class GithubActivity < ActiveRecord::Base
  attr_accessible :id, :author_name, :author_email, :git_sha, :message, :occurred_at, :github_url, :project_id

  belongs_to :project

  def self.from_api(data)
    activities = []
  end
end

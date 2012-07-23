class GithubActivity < ActiveRecord::Base
  attr_accessible :id, :author_name, :author_email, :git_sha, :message, :occurred_at, :github_url, :project_id

  belongs_to :project

  def self.from_api(data)
    activities = []
    data['commits'].each do |commit|
      activities << GithubActivity.create(
        author_name: commit['author']['name'],
        author_email: commit['author']['email'],
        git_sha: commit['id'],
        message: commit['message'],
        occurred_at: Time.parse(commit['timestamp']),
        github_url: commit['url']
      )
    end
    activities
  end
end

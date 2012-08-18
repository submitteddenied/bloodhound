class AddTimestampsToGithubActivities < ActiveRecord::Migration
  def change
    add_column(:github_activities, :created_at, :datetime)
    add_column(:github_activities, :updated_at, :datetime)
  end
end

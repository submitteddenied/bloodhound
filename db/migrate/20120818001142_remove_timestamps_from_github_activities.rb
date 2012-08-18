class RemoveTimestampsFromGithubActivities < ActiveRecord::Migration
  def up
    remove_column :github_activities, :created_at
    remove_column :github_activities, :updated_at
  end

  def down
    add_column(:github_activities, :created_at, :datetime)
    add_column(:github_activities, :updated_at, :datetime)
  end
end

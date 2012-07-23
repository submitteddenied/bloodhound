class CreateGithubActivitiesTable < ActiveRecord::Migration
  def change
    create_table :github_activities do |t|
      t.string :author_name
      t.string :author_email
      t.string :git_sha
      t.string :message
      t.string :github_url
      t.datetime :occurred_at
      t.integer :project_id
    end
  end
end

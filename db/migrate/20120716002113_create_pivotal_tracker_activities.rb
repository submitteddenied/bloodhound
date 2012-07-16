class CreatePivotalTrackerActivities < ActiveRecord::Migration
  def self.up
    create_table :pivotal_tracker_activities do |t|
      t.integer :pt_id
      t.integer :version
      t.string :event_type
      t.datetime :occurred_at
      t.string :author
      t.integer :project_id
      t.string :description
      t.integer :project_id
      t.timestamps
    end
  end

  def self.down
    drop_table :pivotal_tracker_activities
  end
end

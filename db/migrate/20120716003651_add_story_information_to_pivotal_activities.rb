class AddStoryInformationToPivotalActivities < ActiveRecord::Migration
  def change
    add_column :pivotal_tracker_activities, :story_id, :integer
    add_column :pivotal_tracker_activities, :story_url, :string
  end
end

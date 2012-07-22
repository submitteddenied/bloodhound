require File.dirname(__FILE__) + '/../spec_helper'

describe PivotalTrackerActivity do
  it "should be valid" do
    PivotalTrackerActivity.new.should be_valid
  end

  describe '.from_xml' do
    let(:start_story_xml) { File.read('spec/fixtures/api_requests/pivotal_tracker/start_story.xml') } 
    let(:label_two_stories) { File.read('spec/fixtures/api_requests/pivotal_tracker/label_two_stories.xml') } 

    it 'converts xml for starting a single story into an instance of PivotalTrackerActivity' do
      activities = PivotalTrackerActivity.from_xml(start_story_xml)

      activity = activities.first

      activity.author.should == 'Michael Jensen'
      activity.pt_id.should == 518057
      activity.version.should == 116
      activity.event_type.should == 'story_update'
      activity.occurred_at.should == Time.parse('2012/07/16 00:30:00 UTC')
      activity.description.should == 'Michael Jensen started "Move existing data to the Database"'
      activity.story_id.should == 28203109 
      activity.story_url.should == 'http://www.pivotaltracker.com/services/v3/projects/518057/stories/28203109'
    end

    it 'converts xml for labeling of two stories into two instances of PivotalTrackerActivity' do
      activities = PivotalTrackerActivity.from_xml(label_two_stories)

      activities.count.should == 2

      activities[0].author.should == 'Michael Jensen'
    end
  end
  
  describe '.from_api' do
    let(:api_data) do
      {
        'activity' => {
          'id' => 220563299,
          'version' => 116,
          'event_type' => 'story_update',
          'occurred_at' => Time.parse('2012/07/16 00:30:00 UTC'),
          'author' => 'Michael Jensen',
          'project_id' => 518057,
          'description' => 'Michael Jensen started &quot;Move existing data to the Database&quot;',
          'stories' => [
            {
              'id' => 28203109,
              'url' => 'http://www.pivotaltracker.com/services/v3/projects/518057/stories/28203109',
              'current_state' => 'started'
            }
          ]
        }
      }
    end
    
    it 'builds a pivotal tracker activity' do
      activities = PivotalTrackerActivity.from_api(api_data)
      activities[0].should be_instance_of PivotalTrackerActivity
      activities[0].author.should == 'Michael Jensen'
      activities[0].pt_id.should == 518057
      activities[0].version.should == 116
      activities[0].event_type.should == 'story_update'
      activities[0].occurred_at.should == Time.parse('2012/07/16 00:30:00 UTC')
      activities[0].description.should == 'Michael Jensen started &quot;Move existing data to the Database&quot;'
    end
    
    it 'saves the activity' do
      lambda { PivotalTrackerActivity.from_api(api_data) }.should change(PivotalTrackerActivity, :count).by(1)
    end
  end
end

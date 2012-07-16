require File.dirname(__FILE__) + '/../spec_helper'

describe PivotalTrackerActivity do
  it "should be valid" do
    PivotalTrackerActivity.new.should be_valid
  end

  describe '.from_xml' do
    let(:tracker_xml) { File.read('spec/fixtures/api_requests/pivotal_tracker/start_story.xml') } 

    it 'converts input xml to instances of PivotalTrackerActivity' do
      activities = PivotalTrackerActivity.from_xml(tracker_xml)

      activities[0].author.should == 'Michael Jensen'
      activities[0].pt_id.should == 518057
      activities[0].version.should == 116
      activities[0].event_type.should == 'story_update'
      activities[0].occurred_at.should == Time.parse('2012/07/16 00:30:00 UTC')
      activities[0].description.should == 'Michael Jensen started "Move existing data to the Database"'
    end
  end
end

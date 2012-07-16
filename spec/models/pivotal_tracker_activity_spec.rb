require File.dirname(__FILE__) + '/../spec_helper'

describe PivotalTrackerActivity do
  it "should be valid" do
    PivotalTrackerActivity.new.should be_valid
  end

  describe '.from_xml' do
    let(:tracker_xml) do
      <<XML 
        <?xml version="1.0" encoding="UTF-8"?> 
        <activity> 
          <id type="integer">220563299</id> 
          <version type="integer">116</version> 
          <event_type>story_update</event_type> 
          <occurred_at type="datetime">2012/07/16 00:30:00 UTC</occurred_at> 
          <author>Michael Jensen</author> 
          <project_id type="integer">518057</project_id> 
          <description>Michael Jensen started &quot;Move existing data to the Database&quot;</description> 
          <stories type="array"> 
            <story> 
              <id type="integer">28203109</id> 
              <url>http://www.pivotaltracker.com/services/v3/projects/518057/stories/28203109</url> 
              <current_state>started</current_state> 
            </story> 
          </stories> 
        </activity>
XML
    end

    it 'converts input xml to instances of PivotalTrackerActivity' do
      #result = PivotalTrackerActivity.from_xml(tracker_xml)
      #result[:author].should == 'Michael Jensen'
    end
  end
end

require 'spec_helper'

describe PivotalTrackerActivityDecorator do
  describe '#partial' do
    subject do
      PivotalTrackerActivityDecorator.new(stub)
    end
    it 'returns the name of the partial to render for this type of activity' do
      subject.partial.should == 'pivotal_tracker_activity'
    end
  end
end
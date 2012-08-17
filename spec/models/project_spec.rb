require File.dirname(__FILE__) + '/../spec_helper'

describe Project do
  let(:project) do
    Project.new(
      id:         123,
      name:       'Fake project',
      api_key:    'abcd1234',
      password:   'fake_password'
    )
  end

  describe '#activities' do
    it 'returns a sorted list of tracker and github activities' do
      g1 = stub('github_activity', created_at: '2012-07-11')
      g2 = stub('github_activity', created_at: '2012-07-07')
      a1 = stub('tracker_activity', created_at: '2012-07-10')

      GithubActivity.stub(:where).and_return([g1, g2])
      PivotalTrackerActivity.stub(:where).and_return([a1])

      project.activities.should == [g1, a1, g2]
    end
  end
end

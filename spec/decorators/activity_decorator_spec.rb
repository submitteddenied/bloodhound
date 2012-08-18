require File.dirname(__FILE__) + '/../spec_helper'

describe ActivityDecorator do
  subject do
    ActivityDecorator.new(activity)
  end

  describe '.new' do
    context 'when activity is from Github' do
      let(:activity) { GithubActivity.new }

      it 'returns a github decorator' do
        subject.should be_a GithubActivityDecorator
      end
    end

    context 'when activity is from Pivotal Tracker' do
      let(:activity) { PivotalTrackerActivity.new }

      it 'returns a tracker decorator' do
        subject.should be_a PivotalTrackerActivityDecorator
      end
    end
  end
end
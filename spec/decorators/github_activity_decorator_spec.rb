require 'spec_helper'

describe GithubActivityDecorator do
  describe '#partial' do
    subject do
      GithubActivityDecorator.new(stub)
    end
    it 'returns the name of the partial to render for this type of activity' do
      subject.partial.should == 'github_activity'
    end
  end
end
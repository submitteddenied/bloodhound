require File.dirname(__FILE__) + '/../spec_helper'

describe GithubActivity do
  it "should be valid" do
    GithubActivity.new.should be_valid
  end

  describe '.from_api' do
    let(:commit_data) { JSON.parse(File.read('spec/fixtures/api_requests/github/commit.json')) }
    let(:two_pushes_data) { JSON.parse(File.read('spec/fixtures/api_requests/github/push_with_two_commits.json')) }
    
    it 'builds a pivotal tracker activity' do
      activities = GithubActivity.from_api(commit_data)
      activities[0].should be_instance_of GithubActivity
      activities[0].author_name.should == 'Michael Jensen'
      activities[0].author_email.should == 'engineers+mjensen@sharethrough.com'
      activities[0].occurred_at.should == Time.parse('2012-07-22T21:14:15-07:00')
      activities[0].github_url.should == 'https://github.com/emjay1988/bloodhound/commit/7c94df422f1efe7ad452981902328fef30d9122e'
      activities[0].git_sha.should == '7c94df422f1efe7ad452981902328fef30d9122e'
      activities[0].message.should == 'changed readme'
    end
    
    it 'saves the activity' do
      lambda { GithubActivity.from_api(commit_data) }.should change(GithubActivity, :count).by(1)
    end
  end
end

require File.dirname(__FILE__) + '/../spec_helper'

describe GithubActivity do
  it "should be valid" do
    GithubActivity.new.should be_valid
  end

  describe '.from_api' do
    let(:commit_data)         { { "payload" => File.read('spec/fixtures/api_requests/github/commit.json') } }
    let(:two_pushes_data)     { { "payload" => File.read('spec/fixtures/api_requests/github/push_with_two_commits.json') } }
    let(:tag_push)            { { "payload" => File.read('spec/fixtures/api_requests/github/tag_no_commit_data.json') } }
    let(:tag_and_commit_data) { { "payload" => File.read('spec/fixtures/api_requests/github/tag_with_commit_data.json') } }
    
    context 'with a single commit' do
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
    end
    
    context 'with two commits in one push' do
      it 'creates two activities' do
        activities = GithubActivity.from_api(two_pushes_data)
        activities.count.should == 2
      end
    end
    
    context 'with a tag push' do
      it 'creates a "Tag Push" activity' do
        activities = GithubActivity.from_api(tag_push)
        activities[0].message.should == 'Pushed tag: v0.01'
        activities[0].git_sha.should == '8bac69edf751b0fb78b5caaf9a33a9ec54e640b0'
        activities[0].author_name.should == 'emjay1988'
        activities[0].author_email.should == 'emjay1988@gmail.com'
        activities[0].github_url.should == 'https://github.com/emjay1988/bloodhound/compare/v0.01'
      end
    end
    
    context 'with commits in a tag push' do
      let(:activities) { GithubActivity.from_api(tag_and_commit_data) }
      
      it 'creates an activity for both the tag and commit' do
        activities.count.should == 2
      end
      
      it 'correctly creates commit activities' do
        commit_activity = activities[1]
        commit_activity.message.should == "more readme stuff (can you tell I'm testing the github post-receive hook?)"
        commit_activity.git_sha.should == '41378021872f3ecaa03c5b6ca964746a14b2eafc'
      end
      
      it 'correctly creates a tag activity' do
        tag_activity = activities[0]
        tag_activity.message.should == 'Pushed tag: v0.02'
        tag_activity.git_sha.should == '939e549a63a330e28ca0f9c0a8cb9497a79f4126'
      end
    end
    
    it 'saves the activity' do
      lambda { GithubActivity.from_api(commit_data) }.should change(GithubActivity, :count).by(1)
    end
  end
end

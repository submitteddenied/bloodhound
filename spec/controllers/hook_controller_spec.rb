require 'spec_helper'

describe HookController do
  before do
    FactoryGirl.create(:project)
  end
  
  describe '#receive' do
    before do
      PivotalTrackerActivity.expects(:from_api).returns([])
    end
    
    let(:api_data) { {api: 'data'} }
    
    it 'returns 201 for a valid post' do
      post :receive, api_key: 'abcd1234', service: 'tracker', body: api_data
      response.code.should == "201"
    end
    
    context 'for a pivotal tracker update' do
      it 'passes the body to the pivotal tracker activity model' do
        post :receive, api_key: 'abcd1234', service: 'tracker', body: api_data
      end
    end
  end
end

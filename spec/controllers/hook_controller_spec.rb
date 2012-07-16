require 'spec_helper'

describe HookController do
  before do
    FactoryGirl.create(:project)
  end
  
  describe '#receive' do
    it 'returns 201 for a valid post' do
      post :receive, api_key: 'abcd1234', service: 'tracker', body: '<xml>'
      response.code.should == "201"
    end
    context 'for a pivotal tracker update' do
      it 'passes the body to the pivotal tracker activity model' do
        PivotalTrackerActivity.expects(:from_xml).with('<xml>')
        
        post :receive, api_key: 'abcd1234', service: 'tracker', body: '<xml>'
      end
    end
  end
end

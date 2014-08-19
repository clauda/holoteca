require 'spec_helper'

describe Admin::DashboardController, type: :controller do
  let(:user){ FactoryGirl.create :user }

  describe "GET 'index'" do
    before { sign_in user }

    it 'should be successful' do
      get :index
      expect(response).to be_success
    end
  end

end

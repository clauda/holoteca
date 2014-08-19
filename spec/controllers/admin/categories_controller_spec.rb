require 'spec_helper'

describe Admin::CategoriesController, type: :controller do
  let(:user){ FactoryGirl.create :user }
  before { sign_in user }

  describe "GET 'index'" do
    it 'should be successful' do
      get :index
      expect(response).to be_success
    end
  end

  describe "POST 'create'" do
    it 'should be created' do
      post :create, category: { name: 'Holo Bizarro' }
      expect(response).to be_redirect
      expect(Category.all.size).to eq(1)
    end
  end

  describe "POST 'update'" do
    it 'should be updated' do
      post :create, category: { name: 'Holo Bizarro Editado' }
      expect(response).to be_redirect
    end
  end

end

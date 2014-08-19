require 'spec_helper'

describe Admin::ArticlesController, type: :controller do
  let(:user){ FactoryGirl.create :user }
  before { sign_in user }

  describe "GET 'index'" do
    it 'should be successful' do
      get :index
      expect(response).to be_success
    end
  end

  describe "POST 'create'" do
    let(:category){ FactoryGirl.create :category }
    let(:params){ {
      category: category,
      author: user,
      title: 'Holo Bizarro',
      body: 'Lorem Ipsum',
      summary: 'Bacon Ipsum',
      tags: 'lorem,ipsum',
      featured: true,
    } }

    it 'should be created' do
      post :create, article: params
      expect(response).to be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get :new
      expect(response).to be_success
    end
  end

  describe "GET 'edit'" do
    let(:article){ FactoryGirl.create :article }

    pending "returns http success" do
      get :edit, { id: article.permalink }
      expect(response).to be_success
    end
  end

end

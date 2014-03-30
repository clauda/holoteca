require 'spec_helper'

describe HoloController do

  describe "GET 'index'" do
    it 'should be successful' do
      get :index
      expect(response).to be_success
    end
  end

  pending "GET 'article'" do
    let(:article){ FactoryGirl.create :article }

    it 'should be successful' do
      get :article, { article_id: article.permalink }
      expect(response).to be_success
    end
  end

  describe "GET 'category'" do
    let(:category){ FactoryGirl.create :category }

    it 'should be successful' do
      get :category, { category_id: category.permalink }
      expect(response).to be_success
    end
  end

end

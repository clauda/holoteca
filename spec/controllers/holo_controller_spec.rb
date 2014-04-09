require 'spec_helper'

describe HoloController do

  describe "GET 'index'" do
    let(:article){ FactoryGirl.create :article }
    # before { binding.pry }
    it 'should be successful' do
      get :index
      expect(response).to be_success
    end
  end

  pending "GET 'article'" do
    it 'should be successful' do
      get :article, { article_id: article.permalink }
      expect(response).to be_success
    end
  end

  describe "GET 'category'" do
    let(:category){ FactoryGirl.create :category }

    it 'should be successful' do
      get :category, { id: category.permalink }
      expect(response).to be_success
    end
  end

  describe "GET 'tag'" do
    let(:tag){ FactoryGirl.create :tag }

    it 'should be successful' do
      get :tag, { id: tag.permalink }
      expect(response).to be_success
    end
  end

end

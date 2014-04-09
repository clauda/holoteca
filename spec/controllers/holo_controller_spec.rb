require 'spec_helper'

describe HoloController do
  context 'has articles' do

    describe "GET 'index'" do
      pending 'should be successful' do
        get :index
        expect(response).to be_success
      end
    end

    describe "GET 'article'" do
      let(:article){ FactoryGirl.create :article, published: true }

      it 'should be successful' do
        get :article, { article_id: article.permalink }
        expect(response).to be_success
      end
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

  describe "GET 'author'" do
    let(:author){ FactoryGirl.create :user }

    it 'should be successful' do
      get :author, { id: author.permalink }
      expect(response).to be_success
    end
  end

end

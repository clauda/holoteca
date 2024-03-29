require 'spec_helper'

describe HoloController, type: :controller do
  let(:article){ FactoryGirl.create :article, published: true }
  
  context 'has articles' do

    describe "GET 'index'" do
      before { article.reload }
      it 'should be successful' do
        get :index
        expect(response).to be_success
      end
    end

    describe "GET 'article'" do
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

require 'spec_helper'

describe StaticsController, type: :controller do

  describe "GET 'privacy'" do
    it "returns http success" do
      get 'privacy'
      expect(response).to be_success
    end
  end

  describe "POST 'subscribe'" do
    it "returns http success" do
      post 'subscribe', { email: 'assine@holoteca.com.br' }
      expect(response).to be_success
    end

    it "with invalid email returns http success too" do
      post 'subscribe', { email: 'www.com' }
      expect(response).to be_success
    end
  end

end

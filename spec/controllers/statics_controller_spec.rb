require 'spec_helper'

describe StaticsController, type: :controller do

  describe "GET 'privacy'" do
    it "returns http success" do
      get 'privacy'
      expect(response).to be_success
    end
  end

end

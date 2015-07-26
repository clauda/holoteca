require 'spec_helper'

RSpec.describe "Subscription", type: :request do
  describe "POST /assine" do
    it "should be ok" do
      post subscribe_path email: 'oi@email.com'
      expect(response.status).to be(200)
    end
  end
end

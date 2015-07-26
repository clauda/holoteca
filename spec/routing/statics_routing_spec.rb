require "spec_helper"

RSpec.describe StaticsController, type: :routing do
  describe "routing" do
    it "routes to #subscribe" do
      expect(:post => "/assine").to route_to("statics#subscribe")
    end
  end
end

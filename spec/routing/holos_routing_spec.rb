require "spec_helper"

RSpec.describe HoloController, type: :routing do
  describe "routing" do
    it ("routes to #index") { expect(get: "/").to route_to("holo#index") }
    it ("routes to #article") { expect(get: "/lorem-ipsum").to route_to("holo#article", article_id: "lorem-ipsum") }
    it ("routes to #category") { expect(get: "/holos/teca").to route_to("holo#category", id: "teca") }
    it ("routes to #tag") { expect(get: "/tag/cat").to route_to("holo#tag", id: "cat") }
    it ("routes to #author") { expect(get: "/autor/claudia").to route_to("holo#author", id: "claudia") }
  end
end

require 'spec_helper'

describe User do
  subject { FactoryGirl.create :user, twitter: nil }
  it { expect(subject).to be_valid }
  it('#first_name') { expect(subject.first_name).to eq('Holoteca') }

  describe "#twitter_username" do
    let(:livia){ FactoryGirl.create :user, twitter: "http://twitter.com/username" }
    it("has twitter no account") { expect(subject.twitter_username).to eql('@holoteca') }
    it("has twitter account") { expect(livia.twitter_username).to eql('@username') }
  end
end

require 'spec_helper'

RSpec.describe Subscriber, type: :model do
  subject { FactoryGirl.create :subscriber }
  it { expect(subject).to be_valid }
  it { expect(subject).to be_active }

  describe "entry with a invalid email" do
    let(:wrong_email){ FactoryGirl.build :subscriber, email: 'www.com' }

    it "do not create model" do
      expect(wrong_email).to_not be_valid
    end
  end
end

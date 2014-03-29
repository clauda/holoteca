require 'spec_helper'

describe Article do
  subject { FactoryGirl.create :article }
  it { expect(subject).to be_valid }
  it('#to_param') { expect(subject.to_param).to eq('lorem-ipsum-dolor-sit-amet-consectetur-adipisicing-elit') }
end

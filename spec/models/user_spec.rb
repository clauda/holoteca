require 'spec_helper'

describe User do
  subject { FactoryGirl.create :user }
  it { expect(subject).to be_valid }
end

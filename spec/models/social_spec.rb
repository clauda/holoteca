require 'spec_helper'

describe Social do
  subject { FactoryGirl.create :social }
  it { expect(subject).to be_valid }
end
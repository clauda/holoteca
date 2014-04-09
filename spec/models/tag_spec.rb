require 'spec_helper'

describe Tag do
  subject { FactoryGirl.create :tag }
  it { expect(subject).to be_valid }
end
require 'spec_helper'

describe Book do
  subject { FactoryGirl.create :book }
  it { expect(subject).to be_valid }
end

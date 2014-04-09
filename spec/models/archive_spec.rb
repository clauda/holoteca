require 'spec_helper'

describe Archive do
  subject { FactoryGirl.create :archive }
  pending { expect(subject).to be_valid }
end

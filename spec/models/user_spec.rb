require 'spec_helper'

describe User do
  subject { FactoryGirl.create :user }
  it { expect(subject).to be_valid }
  it('#first_name') { expect(subject.first_name).to eq('Holoteca') }
end

require 'spec_helper'

describe Category do
  subject { FactoryGirl.create :category }
  it { expect(subject).to be_valid }

  describe '#to_param' do
    let(:category) { FactoryGirl.create :category, name: 'Holo Teca' }
    it { expect(category.to_param).to eq('holo-teca') }
  end
end

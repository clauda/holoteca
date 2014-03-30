require 'spec_helper'

describe Article do
  subject { FactoryGirl.create :article }
  it { expect(subject).to be_valid }

  pending('.by_slug') { expect(Article.by_slug('lorem-ipsum')).to eq(subject) }

  it('#to_param') { expect(subject.to_param).to eq('lorem-ipsum') }

  it('#setup') do
    expect(subject.permalink).to eq('lorem-ipsum')
    expect(subject.published_at.to_time.to_s).to eq(Time.now.to_time.to_s)
  end

end

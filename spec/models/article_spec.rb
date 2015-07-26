require 'spec_helper'

describe Article do
  subject { FactoryGirl.create :article, published: true }
  it { expect(subject).to be_valid }

  describe('.by_slug') do 
    before { subject.reload }
    it("find article by slug" ) { expect(Article.by_slug('lorem-ipsum').title).to eq(subject.title) }
  end

  it('.meta.sent') { expect(subject.meta[:sent]).to eql(false) }

  it('#to_param') { expect(subject.to_param).to eq('lorem-ipsum') }

  it('#setup') do
    expect(subject.permalink).to eq('lorem-ipsum')
    expect(subject.published_at.to_time.to_s).to eq(Time.now.to_time.to_s)
  end

end

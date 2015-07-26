require "spec_helper"

RSpec.describe NewsletterMailer, type: :mailer do
  describe "lastest" do
    let(:ids){ Article.all.pluck(:id).map(&:to_s) }
    let(:mail){ NewsletterMailer.lastest('to@example.org', ids) }

    it "renders the headers" do
      expect(mail.subject).to eq("Novidades no Holoteca")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["assinatura@holoteca.com.br"])
    end

  end

end

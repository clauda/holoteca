class NewsletterMailer < ActionMailer::Base
  include Roadie::Rails::Automatic
  default from: "assinatura@holoteca.com.br"

  layout 'email'
  prepend_view_path 'app/views/mailers'

  def lastest(email, ids, subject = 'Novidades no Holoteca')
    @articles = Article.in(id: ids)
    mail(to: email, subject: subject)
  end

end

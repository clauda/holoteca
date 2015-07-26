namespace :newsletter do

  desc "Articles form last week"
  task :lastest => [:environment] do
    # TODO: move to worker
    @articles = Article.unread.where(published_at: 1.year.ago..Date.today).limit(10)
    if @articles
      subject = @articles.where(featured: true).first.try(:title) || @articles.first.title
      ids = @articles.pluck(:id).map(&:to_s)

      Subscriber.actived.each do |subscribe| 
        NewsletterMailer.lastest(subscribe.email, ids, subject).deliver
        puts "Email sent to #{subscribe.email}"
      end

      @articles.set(meta: { sent: true })
    end
  end

end
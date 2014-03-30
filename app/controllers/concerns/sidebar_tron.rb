module SidebarTron
  extend ActiveSupport::Concern

  included do
    before_filter :sidebar
  end

  def sidebar
    @categories = Category.all.includes(:articles)
    @articles = Article.visible
  end

end
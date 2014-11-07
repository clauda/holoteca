module SidebarTron
  extend ActiveSupport::Concern

  included do
    before_filter :sidebar
  end

  protected

    def sidebar
      @categories = Category.all unless fragment_exist? 'top_menu'
      @lastest = Article.includes(:category).lastest unless fragment_exist? 'lastest_posts'
    end

end
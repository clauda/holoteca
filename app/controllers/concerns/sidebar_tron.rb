module SidebarTron
  extend ActiveSupport::Concern

  included do
    before_filter :sidebar
  end

  protected

    def sidebar
      @categories = Category.all.includes(:articles)
      @articles = Article.visible
    end

    def raise_404
      render_404 if @resource.nil?
    end

end
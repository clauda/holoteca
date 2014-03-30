class HoloController < ApplicationController
  include SidebarTron

  def index; end

  def article
    @resource = Article.by_slug params[:article_id]
    render_404 unless @resource.published
  end

  def category
    @resource = Category.by_slug(params[:category_id])
  end

end

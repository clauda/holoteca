class HoloController < ApplicationController
  include SidebarTron

  def index; end

  def article
    @resource = Article.by_slug params[:article_id]
    @resource.published ? render('articles/show') : render_404
  end

  def category
    @resource = Category.by_slug(params[:category_id])
    render 'categories/show'
  end

end

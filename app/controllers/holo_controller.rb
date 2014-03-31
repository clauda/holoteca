class HoloController < ApplicationController
  include SidebarTron
  after_action :raise_404, only: [ :category, :tag ]

  def index; end

  def article
    @resource = Article.by_slug params[:article_id]
    render_404 unless @resource and @resource.published
  end

  def category
    @resource = Category.by_slug(params[:id])
  end

  def tag
    @resource = Tag.by_slug(params[:id])
  end

end

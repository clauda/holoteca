class HoloController < ApplicationController
  include SidebarTron
  after_action :raise_404, only: [ :category, :tag, :author ]

  def index; end

  def article
    @resource = Article.by_slug params[:article_id]
    # render_404 unless @resource and @resource.published
  end

  def category
    @resource = Category.includes(:articles).by_slug(params[:id])
  end

  def tag
    @resource = Tag.includes(:articles).by_slug(params[:id])
  end

  def author
    @resource = User.includes(:articles).by_slug(params[:id])
  end

end

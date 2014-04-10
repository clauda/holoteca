class HoloController < ApplicationController
  include SidebarTron
  after_action :raise_404, only: [ :category, :tag, :author ]

  def index
    @articles = Article.includes(:category, :author).visible
    fresh_when last_modified: @articles.last.published_at.utc, public: true
  end

  def article
    @resource = Article.by_slug params[:article_id]
    @related = Article.related @resource.tags.pluck(:name), @resource.id
    fresh_when etag: @resource, last_modified: @resource.published_at.utc, public: true
    render_404 unless @resource and @resource.published
  end

  def category
    @resource = Category.includes(:articles).by_slug(params[:id])
    fresh_when etag: @resource, last_modified: @resource.updated_at.try(:utc), public: true
  end

  def tag
    @resource = Tag.includes(:articles).by_slug(params[:id])
    fresh_when etag: @resource, public: true
  end

  def author
    @resource = User.includes(:articles).by_slug(params[:id])
    fresh_when etag: @resource, public: true
  end

end

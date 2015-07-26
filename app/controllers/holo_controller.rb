class HoloController < ApplicationController
  include SidebarTron

  def index
    @featured_slide = Article.featured unless fragment_exist? 'featured_posts'
    @articles = Article.includes(:category, :author).where(:id.nin => @featured_slide.pluck(:id)).visible.limit 9

    fresh_when last_modified: @articles.last.published_at.utc, public: true
  end

  def article
    @resource = Article.by_slug params[:article_id]
    return oh_not_found unless @resource and @resource.published?

    @related = Article.related @resource.tags.pluck(:name), @resource.id
    @featured = @resource.category.articles.lastest.limit(5) if @related.empty?
    fresh_when etag: @resource, last_modified: @resource.published_at.utc, public: true
  end

  def category
    @resource = Category.includes(:articles).by_slug(params[:id])
    return oh_not_found unless @resource

    @featured = Article.featured.limit 5
    fresh_when etag: @resource, last_modified: @resource.updated_at.try(:utc), public: true
  end

  def tag
    @resource = Tag.includes(:articles).by_slug(params[:id])
    return oh_not_found unless @resource
    
    @related = Article.related [@resource.name], ''
    @featured = @resource.articles.lastest.limit(5) if @related.empty?
    fresh_when etag: @resource, public: true
  end

  def author
    @resource = User.includes(:articles).by_slug(params[:id])
    return oh_not_found unless @resource
    
    @featured = Article.featured.limit 5
    fresh_when etag: @resource, public: true
  end

end

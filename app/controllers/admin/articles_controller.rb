class Admin::ArticlesController < InheritedResources::Base
  include Cacheable

  before_filter :authenticate_user!
  after_filter :expire_modules,   only: [ :create, :update ]
  after_filter :expire_resource,  only: [ :update ]

  caches_action :index, :show

  defaults finder: :by_slug
  layout 'admin'

  def create
    resource = Article.new permitted_params[:article]
    resource.taggify params[:article][:tags]
    create!
  end

  def update
    resource.taggify params[:article][:tags]
    update!
  end

  protected

    def permitted_params
      params.permit article: [ :category, :author, :title, :summary, :body, :published, :featured, :font, :cover_url, tags: [] ]
    end

end

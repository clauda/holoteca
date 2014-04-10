class Admin::ArticlesController < InheritedResources::Base
  include Cacheable

  before_filter :authenticate_user!
  after_filter :expire_sidebar,   only: [ :create, :update ]
  after_filter :expire_resource,  only: [ :update ]

  caches_action :index, :show

  defaults finder: :by_slug
  layout 'admin'

  def create
    expire_action action: :index
    resource = Article.new permitted_params[:article]
    resource.taggify params[:article][:tags]
    create!
  end

  def update
    expire_action action: :index
    resource.taggify params[:article][:tags]
    update!
  end

  protected

    def permitted_params
      params.permit article: [ :category, :author, :title, :summary, :body, :published, :cover_url, tags: [] ]
    end

end

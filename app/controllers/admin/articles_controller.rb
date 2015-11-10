class Admin::ArticlesController < InheritedResources::Base
  include Cacheable

  before_filter :authenticate_user!
  after_filter :expire_modules,   only: [ :create, :update, :destroy ]
  after_filter :expire_resource,  only: [ :update ]

  defaults finder: :by_slug
  layout 'admin'

  def index
    @articles = current_user.admin? ? collection.order(published_at: :desc) : current_user.articles.order(published_at: :desc)
    super
  end

  def create
    resource = Article.new permitted_params[:article]
    resource.taggify params[:article][:tags]
    create!
  end

  def update
    resource.taggify params[:article][:tags]
    update!
  end

  def destroy
    resource.update(published: false)
    redirect_to :back, notice: 'Não é possível remover! Artigo despublicado.'
  end

  protected

    def permitted_params
      params.permit article: [ :category, :author, :title, :summary, :body, :published, :featured, :font, :cover_url, tags: [] ]
    end

end

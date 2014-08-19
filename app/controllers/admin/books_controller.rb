class Admin::BooksController < InheritedResources::Base
  include Cacheable

  before_filter :authenticate_user!
  after_filter :expire_modules,   only: [ :create, :update, :destroy ]
  after_filter :expire_resource,  only: [ :update ]

  caches_action :index

  defaults finder: :by_slug
  layout 'admin'

  def chapter
    resource.articles.build
  end

  protected

    def permitted_params
      params.permit book: [ :title, :summary, :published,
        articles_attributes: [ :author, :cover_url, :title, :summary, :body, :published, :featured, tags: [] ] ]
    end

end


class Admin::ArticlesController < InheritedResources::Base
  before_filter :authenticate_user!
  defaults finder: :by_slug
  layout 'admin'

  def create
    create!
    resource.taggify params[:article][:tags]
  end

  def update
    resource.taggify params[:article][:tags]
    update!
  end

  protected

    def permitted_params
      params.permit article: [ :category, :author, :title, :summary, :body, :published, tags: [] ]
    end

end

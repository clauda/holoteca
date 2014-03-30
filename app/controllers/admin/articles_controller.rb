class Admin::ArticlesController < InheritedResources::Base
  before_filter :authenticate_user!
  defaults finder: :by_slug
  layout 'admin'

  protected

    def permitted_params
      params.permit article: [ :category, :author, :title, :summary, :body, :published ]
    end

end

class ErrorsController < ApplicationController
  include SidebarTron
  
  def error_404
    @featured = Article.featured unless fragment_exist? 'featured_posts'
    render status: :not_found
  end
end
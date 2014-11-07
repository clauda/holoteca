class ErrorsController < ApplicationController
  include SidebarTron
  
  def error_404
    render status: :not_found
  end
end
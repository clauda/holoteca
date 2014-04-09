class Admin::DashboardController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin'

  def index
    @articles = Article.visible
  end
end

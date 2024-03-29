class Admin::DashboardController < ApplicationController
  include Cacheable
  before_filter :authenticate_user!
  layout 'admin'

  def index
    @articles = Article.visible
    @subscribers = Subscriber.all
  end

  def clear_cache
    destroy_aaaaaaall_cache!
    redirect_to :back, notice: "Os dados em cache do site foram apagados."
  end
end

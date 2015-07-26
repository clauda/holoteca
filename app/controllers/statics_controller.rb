class StaticsController < ApplicationController
  include SidebarTron
  def privacy; end
  def contact; end

  def subscribe
    @subscriber = Subscriber.create(email: params[:email])
    render nothing: true
  end
end

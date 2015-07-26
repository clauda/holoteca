class Admin::SubscribersController < InheritedResources::Base
  before_filter :authenticate_user!
  actions :index, :edit, :update, :create
  layout 'admin'

  def destroy
    resource.destroy
    redirect_to admin_subscribers_path, notice: 'Destruído'
  end

  protected

    def permitted_params
      params.permit subscribers: [ :email, :active ]
    end

end

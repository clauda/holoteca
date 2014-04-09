class Admin::ArchivesController < InheritedResources::Base
  before_filter :authenticate_user!
  actions :index, :create
  layout 'admin'

  def create
    create! do |success, failure|
      success.html { redirect_to admin_archives_path, notice: 'Works, babe!' }
      failure.html { redirect_to admin_archives_path, alert: resource.errors.full_message }
    end
  end

  protected

    def permitted_params
      params.permit archive: [ :image ]
    end

end

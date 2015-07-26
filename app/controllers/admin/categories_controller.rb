class Admin::CategoriesController < InheritedResources::Base
  before_filter :authenticate_user!
  actions :index, :edit, :update, :create
  layout 'admin'

  def create
    expire_fragment 'top_menu'
    create! do |success, failure|
      success.html { redirect_to admin_categories_path, notice: 'Works, babe!' }
      failure.html { redirect_to admin_categories_path, alert: 'Inválido!' }
    end
  end

  def update
    resource = Category.by_slug params[:id]
    resource.update_attributes permitted_params[:category]
    redirect_to admin_categories_path, notice: 'Pray!'
  end

  protected

    def permitted_params
      params.permit category: [ :name, :summary ]
    end

end

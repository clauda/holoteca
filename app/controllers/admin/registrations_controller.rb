class Admin::RegistrationsController < Devise::RegistrationsController
  layout 'admin'

  # TODO: fixes registrations from admin
  def create
    if resource.save
      set_flash_message :notice, :created
      redirect_to admin_user_path(resource)
    else
      clean_up_passwords resource
      render 'admin/users/new', alert: resource.errors.full_messages
    end
  end

  def update
    account_update_params = devise_parameter_sanitizer.sanitize(:account_update)

    # required for settings form to submit when password is left blank
    if account_update_params[:password].blank?
      account_update_params.delete("password")
      account_update_params.delete("password_confirmation")
    end

    if resource.update_attributes(account_update_params)
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      # sign_in @user, :bypass => true
      redirect_to :back
    else
      redirect_to :back, alert: resource.errors.full_messages
    end
  end

end
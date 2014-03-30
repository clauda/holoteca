require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    admin_root_path
  end

  protected
    # There are just three actions in Devise that allows any set of parameters to be passed down to the model,
    # therefore requiring sanitization. Their names and the permited parameters by default are:

    # sign_in (Devise::SessionsController#new) - Permits only the authentication keys (like email)
    # sign_up (Devise::RegistrationsController#create) - Permits authentication keys plus password and password_confirmation
    # account_update (Devise::RegistrationsController#update) - Permits authentication keys plus password, password_confirmation
    # and current_password. More at https://github.com/plataformatec/devise#strong-parameters

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |user| user.permit(:name, :email, :password, :password_confirmation) }

      devise_parameter_sanitizer.for(:account_update) do |user|
        user.permit(:name, :email, :password, :password_confirmation)
      end
    end
end

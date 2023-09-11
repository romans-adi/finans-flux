class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index], if: -> { controller_name == 'splash' }

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password,])
  end

  protected

  def after_sign_in_path_for(_resource)
    categories_path
  end

  def after_sign_out_path_for(_resource)
    splash_root_path
  end
end

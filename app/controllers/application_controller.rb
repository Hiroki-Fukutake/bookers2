class ApplicationController < ActionController::Base
protect_from_forgery with: :exception
 before_action :configure_permitted_parameters, if: :devise_controller?
  protected
	def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    added_attrs = [:name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end
  def after_sign_up_path_for(resource)
    user_path(current_user.id)
  end
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end
  def after_sign_out_path_for(resource)
    new_user_session_path
  end

end

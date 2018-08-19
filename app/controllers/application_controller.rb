class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def check_classification_admin
    unless current_user.admin?
      flash[:alert] = 'You are not authorized to perform this action!'
      redirect_back fallback_location: root_path
    end
  end

  def check_classification_doc
    unless current_user.admin? || current_user.doc?
      flash[:alert] = 'You are not authorized to perform this action!'
      redirect_back fallback_location: root_path
    end
  end

  protected

  def configure_permitted_parameters
    attributes = [:first_name, :last_name,:user_name, :email, :phone]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end

end

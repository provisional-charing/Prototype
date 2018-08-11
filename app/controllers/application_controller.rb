class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def check_classification
    unless current_user.admin?
      flash[:alert] = 'You are not authorized to perform this action!'
      redirect_back fallback_location: root_path
    end
  end
end

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.require(:user).permit(:sign_up, key: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday])
  end
end

class ApplicationController < ActionController::Base
  before_action :authenticate
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  private

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "admin" && password == "Enter_the_site_2024!"
    end
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :phone_number, :full_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :phone_number, :full_name, :profile_pic, :bio,:private])
  end

end

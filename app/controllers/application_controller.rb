class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from CanCan::AccessDenied, with: :page_error

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit :username, :email, :phone_number, :image,
        :password, :password_confirmation
    end
  end

  def page_error
    render template: "public/404", status: 403
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  helper_method :get_member
  include ApplicationHelper
  before_action :configure_permitted_parameters, if: :devise_controller?

  def show_error(ar_object)
    ar_object.errors.full_messages.join(' // ')
  end

  def get_member
    TeamMember.where(user: current_user.id).first
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :email, :password, :remember_me) }
  end
end

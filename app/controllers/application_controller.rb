class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  # before_action :is_member_valid, if: !:devise_controller?
  helper_method :get_member
  include ApplicationHelper
  before_action :configure_permitted_parameters, if: :devise_controller?

  def show_error(ar_object)
    ar_object.errors.full_messages.join(' // ')
  end

  def get_member
    if current_user.present?
      team_member = TeamMember.find_by_user_id(current_user.id)
      unless team_member.present?
        team_member = TeamMember.find_by_email(current_user.email)
        if team_member.present?
          team_member.user_id = current_user.id
          team_member.save
        else
          sign_out_and_redirect(current_user)
        end
      end
      team_member
    end
  end

  def user_for_paper_trail
    get_member.present? ? get_member.full_name : 'System'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:sign_up) << :login
  end
end

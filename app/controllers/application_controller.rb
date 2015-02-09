class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  helper_method :get_member
  include ApplicationHelper

  def show_error(ar_object)
    ar_object.errors.full_messages.join(' // ')
  end

  def get_member
    TeamMember.where(user:current_user.id).first
  end
end

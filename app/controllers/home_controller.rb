class HomeController < ApplicationController
  def index
    if get_member.present?
      render :layout => 'layouts/blank_body_with_navbar'
    else
      render :layout => 'layouts/blank_body'
    end
  end
end
